import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_flix_app/app/modules/movie_list/controllers/movie_list_controller.dart';
import 'package:movie_flix_app/app/networking/response_model/now_playing/now_playing_response.dart';
import 'package:movie_flix_app/app/utils/app_tags.dart';
import 'package:movie_flix_app/app/utils/app_theme.dart';
import 'package:movie_flix_app/app/utils/app_utils.dart';
import 'package:movie_flix_app/app/utils/color_constant.dart';
import 'package:movie_flix_app/app/utils/widgets/custom_divider.dart';

class NowPlayingList extends StatelessWidget {
  final MovieListController movieListController;
  final List<Results> results;

  const NowPlayingList({
    super.key,
    required this.movieListController,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return movieListController.isLoading
              ? const CupertinoActivityIndicator(
                  color: ColorConstant.black,
                  radius: 20,
                )
              : Dismissible(
                  key: Key(results[index].title!),
                  background: Container(color: Colors.red),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    results.removeAt(index);
                    AppUtils.successSnackBar(message: "Deleted");
                  },
                  child: SizedBox(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// POSTER IMAGE
                              SizedBox(
                                height: 160,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${AppTags.posterPath}${results[index].poster_path}",
                                  placeholder: (context, url) =>
                                      const CupertinoActivityIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),

                              /// TITLE AND OVERVIEW TEXT
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 16),
                                        child: Text(
                                          results[index].title!,
                                          style: AppTheme.ibm20Black,
                                        ),
                                      ),
                                      Text(
                                        results[index].overview!,
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const CustomDivider(),
                      ],
                    ),
                  ),
                );
        });
  }
}
