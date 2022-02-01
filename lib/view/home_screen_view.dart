import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/extension/context_extension.dart';
import 'package:todo/helper/app_localization.dart';
import 'package:todo/view_model/app_language_view_model.dart';
import 'package:todo/view_model/home_screen_view_model.dart';
import 'package:todo/widget/text_fonts_generator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppLanguage>(
      builder: (context, viewModel, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: TextStyleGenerator(
              text:  AppLocalizations.of(context)!.translate('title'),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: TextStyleGenerator(
              text: viewModel.appLocal.languageCode.toString().toUpperCase(),
            ),
            onPressed: () {
              viewModel.chanageLanguageSeperator();
            },
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                usersListWidget(viewModel),
                todosListWidget(viewModel),
                /* Center(
                  child: InkWell(
                    onTap: () {},
                    child: TextStyleGenerator(
                      text: AppLocalizations.of(context)!.translate('title'),
                      color: Colors.black,
                      fontSize: 32,
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget usersListWidget(AppLanguage viewModel) {
    return Consumer<HomeScreenViewModel>(
      builder: (context, viewModel, child) => viewModel.userEnum ==
              UserEnum.Loading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextStyleGenerator(
                    text:  AppLocalizations.of(context)!.translate('users'),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  width: context.getDynmaicWidth(1),
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: viewModel.users.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          viewModel
                              .changeSelecetedUser(viewModel.users[index]!.id);
                        },
                        child: Container(
                          width: context.getDynmaicWidth(.7),
                          child: Center(
                            child: Card(
                              color: viewModel.users[index]!.id ==
                                      viewModel.selecetedUserId
                                  ? Colors.redAccent
                                  : Colors.white,
                              child: ListTile(
                                leading: TextStyleGenerator(
                                  text: viewModel.users[index]!.id.toString(),
                                ),
                                title: TextStyleGenerator(
                                  text: viewModel.users[index]!.name,
                                ),
                                subtitle: TextStyleGenerator(
                                  text: viewModel.users[index]!.username,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget todosListWidget(AppLanguage viewModel) {
    return Consumer<HomeScreenViewModel>(
      builder: (context, viewModel, child) => viewModel.todoEnum ==
              TodoEnum.Loading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextStyleGenerator(
                    text:  AppLocalizations.of(context)!.translate('todos'),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  width: context.getDynmaicWidth(1),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: viewModel.todos.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: context.getDynmaicWidth(.5),
                        child: Center(
                          child: Card(
                            child: ListTile(
                              leading: viewModel.todos[index]!.completed!
                                  ? Icon(Icons.timelapse)
                                  : Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ),
                              title: TextStyleGenerator(
                                text: viewModel.todos[index]!.title
                                    .toString()
                                    .toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: TextStyleGenerator(
                                text: "User Id : " +
                                    viewModel.todos[index]!.userId.toString(),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
