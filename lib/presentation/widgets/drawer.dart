import 'package:chatgpt/presentation/blocs/messages_bloc/messages_bloc.dart';
import 'package:chatgpt/presentation/widgets/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme/fonts.dart';
import 'change_api_key.dart';
import 'chats_listtile.dart';
import 'delete_dialog.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<MessagesBloc, MessagesState>(
        builder: (context, state) {
          if (state is MessagesLoadedState) {
            return Column(
              children: [
                // add new chat
                Padding(
                  padding:
                      EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 15),
                  child: ListTile(
                      dense: true,
                      horizontalTitleGap: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      leading: Icon(Icons.add),
                      title: Text('New Chat', style: pageTitle(context)),
                      onTap: () {
                        context.read<MessagesBloc>().add(AddNewChat());
                      }),
                ),

                // chats list
                Expanded(
                    child: state.chats.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.chats.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) => ChatsListTile(
                              index: index,
                              onDelete: () {
                                DeleteDialog(context, state, index);
                              },
                              onTap: () {
                                context
                                    .read<MessagesBloc>()
                                    .add(SwitchChat(index: index));
                              },
                            ),
                          )
                        : SizedBox.shrink()),

                // Change API Key
                ChangeAPIKey(),
              ],
            );
          } else {
            return Expanded(
              child: Center(
                child: spinkit,
              ),
            );
          }
        },
      ),
    );
  }
}
