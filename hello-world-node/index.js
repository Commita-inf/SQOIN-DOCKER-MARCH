const express = require("express");
const app = express();

app.get("/", (req, res) => {
	res.send("Hello SQOIN 2026");
});

const port = 3000;
app.listen(port, () => {
	console.log(`Server running at http://localhost:${port}`);
});
