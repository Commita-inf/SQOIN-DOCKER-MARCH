import { useState, useEffect } from "react";
import reactLogo from "./assets/react.svg";
import "./App.css";

function App() {
	const [articles, setArticles] = useState([]);

	useEffect(() => {
		fetch("http://192.168.100.12:4567/articles")
			.then((res) => res.json())
			.then((data) => setArticles(data))
			.catch((err) => console.error(err));
	}, []);

	return (
		<div>
			<h1>List of Articles</h1>
			<ul>
				{articles.map((article) => (
					<li key={article.id}>{article.title}</li>
				))}
			</ul>
		</div>
	);
}

export default App;
