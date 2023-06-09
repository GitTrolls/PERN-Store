CREATE TABLE public.cart
(
    id integer NOT NULL,
    user_id integer,
    PRIMARY KEY (id)
);

CREATE TABLE public.cart_item
(
    id integer NOT NULL,
    cart_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.order_item
(
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.orders
(
    order_id integer NOT NULL,
    user_id integer NOT NULL,
    status character varying(20) NOT NULL,
    date timestamp without time zone DEFAULT CURRENT_DATE NOT NULL,
    amount real,
    total integer,
    stripe_payment_id character varying(100),
    PRIMARY KEY (order_id)
);

CREATE TABLE public.products
(
    product_id integer NOT NULL,
    name character varying(50) NOT NULL,
    price real NOT NULL,
    description text NOT NULL,
    image_url character varying,
    PRIMARY KEY (product_id)
);

CREATE TABLE public."resetTokens"
(
    id integer NOT NULL,
    email character varying NOT NULL,
    token character varying NOT NULL,
    used boolean DEFAULT false NOT NULL,
    expiration timestamp without time zone,
    PRIMARY KEY (id)
);

CREATE TABLE public.reviews
(
    user_id integer NOT NULL,
    content text NOT NULL,
    rating integer NOT NULL,
    product_id integer NOT NULL,
    date date NOT NULL,
    id integer NOT NULL,
    PRIMARY KEY (user_id, product_id)
);

CREATE TABLE public.users
(
    user_id integer NOT NULL,
    password character varying(200),
    email character varying(100) NOT NULL,
    fullname character varying(100) NOT NULL,
    username character varying(50) NOT NULL,
    google_id character varying(100),
    roles character varying(10)[] DEFAULT '{customer}'::character varying[ NOT NULL,
    address character varying(200),
    city character varying(100),
    state character varying(100),
    country character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id)
);

ALTER TABLE public.cart
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (user_id)
    NOT VALID;


ALTER TABLE public.cart_item
    ADD FOREIGN KEY (cart_id)
    REFERENCES public.cart (id)
    NOT VALID;


ALTER TABLE public.cart_item
    ADD FOREIGN KEY (product_id)
    REFERENCES public.products (product_id)
    NOT VALID;


ALTER TABLE public.order_item
    ADD FOREIGN KEY (order_id)
    REFERENCES public.orders (order_id)
    NOT VALID;


ALTER TABLE public.order_item
    ADD FOREIGN KEY (product_id)
    REFERENCES public.products (product_id)
    NOT VALID;


ALTER TABLE public.orders
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (user_id)
    NOT VALID;


ALTER TABLE public.reviews
    ADD FOREIGN KEY (product_id)
    REFERENCES public.products (product_id)
    NOT VALID;


ALTER TABLE public.reviews
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (user_id)
    NOT VALID;
