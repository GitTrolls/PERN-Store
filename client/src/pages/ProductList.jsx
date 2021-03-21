import { Card, Pagination } from "@windmill/react-ui";
import Product from "components/Product";
import Spinner from "components/Spinner";
import { useProduct } from "context/ProductContext";
import Layout from "layout/Layout";
import React from "react";
import { Link } from "react-router-dom";

const ProductList = () => {
  const { products, setPage } = useProduct();

  const handleChange = (page) => {
    setPage(page);
  };

  if (!products) {
    return (
      <>
        <Spinner size={100} loading />
      </>
    );
  }

  return (
    <Layout>
      <div className="container py-20 mx-auto">
        <Card className="flex flex-wrap h-full mx-2">
          {products?.map((prod) => (
            <Link
              className="w-full flex flex-col justify-between sm:w-1/2 md:w-1/3 lg:w-1/4 my-2 px-2 box-border"
              key={prod.product_id}
              to={`products/${prod.product_id}`}
            >
              <Product product={prod} />
            </Link>
          ))}
        </Card>
        <a href="# ">
          <Pagination
            totalResults={20}
            resultsPerPage={12}
            onChange={handleChange}
            label="Page navigation"
          />
        </a>
      </div>
    </Layout>
  );
};

export default ProductList;
