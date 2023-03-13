import 'package:flutter/material.dart';
import 'package:step_1/constants/api_constants.dart';
import 'package:step_1/constants/text_constants.dart';
import 'package:step_1/models/topnews_model.dart';
import 'package:step_1/services/fetch_service.dart';
import 'package:step_1/theme/app_colors.dart';
import 'package:step_1/theme/text_style.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TopNews? topNews;
  Future<void> fetchNews() async {
    topNews = await TopNewsRepo().fetchTopNews();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primari,
        leading: const Icon(Icons.newspaper_outlined),
        title: const Text(AppText.topNewsAppBartitle),
      ),
      body: topNews == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: topNews!.articles.length,
              itemBuilder: (BuildContext context, int index) {
                final news = topNews!.articles[index];
                return Card(
                  color: AppColors.primari,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Image.network(
                          news.urlToImage ?? ApiConst.defaultImege,
                          // width: size.width / 2,
                          // height: size.height ,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            news.title,
                            style: AppTexStyle.newsTextstyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
