const {
  getAllUsers,
  createUser,
  deleteUser,
  getUserById,
  updateUser,
} = require("../controllers/users.controller");
const router = require('express').Router();
const verifyAdmin = require("../middleware/verifyAdmin");
const verifyToken = require("../middleware/verifyToken");

router.use(verifyToken);
router.route("/").get(verifyAdmin, getAllUsers).post(verifyAdmin,createUser);
router.route("/:id").get(getUserById).put(updateUser).delete(deleteUser);


module.exports = router;
