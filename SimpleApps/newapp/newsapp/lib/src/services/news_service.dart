import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/src/models/NewsResponseModel.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/src/models/category_model.dart';

class NewsService with ChangeNotifier {
  final _URL_NEWS = 'https://newsapi.org/v2';
  final _APIKEY = '93242fe4d087489d988f4fa0e6dfae9a';
  String _selectedCategory = 'business';

  List<Article> headlines = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'science'),
    Category(FontAwesomeIcons.baseballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    this.gettopHeadlines();

    categories.forEach((item) {
      categoryArticles[item.name] = [];
    });
  }

  get selectedCategory => this._selectedCategory;

  set selectedCategory(String valor) {
    this._selectedCategory = valor;
    this.getArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article> get getArticuloCategoria =>
      this.categoryArticles[this.selectedCategory];

  gettopHeadlines() async {
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us';

    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson(resp.body);

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (this.categoryArticles[category].length > 0)
      return categoryArticles[category];

    final url =
        '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us&category=$category';

    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson(resp.body);

    categoryArticles[category].addAll(newsResponse.articles);

    notifyListeners();
  }
}
