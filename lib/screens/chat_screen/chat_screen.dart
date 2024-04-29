import 'package:chat_app/bloc/login_bloc/login_bloc.dart';
import 'package:chat_app/bloc/login_bloc/login_state.dart';
import 'package:chat_app/data/models/user_model/user_model.dart';
import 'package:chat_app/screens/group_screen/group_screen.dart';
import 'package:chat_app/utils/images/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                      child: Image.asset(AppImages.friend,
                          width: 70.w, height: 70.w, fit: BoxFit.cover)),
                  Text(
                    "Jigars",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppImages.fontPoppins,
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=> const GroupScreen()));
                    },
                    icon: Icon(
                      Icons.message_rounded,
                      color: Colors.black,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoadingState) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                ));
              }
              if (state is UserSuccessState) {
                List<UserModel> users = state.users;
                return Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) => Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(15.w),
                      padding: EdgeInsets.all(15.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color : Colors.black,
                          width: 1.sp
                        )
                      ),
                      child: Center(
                        child: Text(
                          users[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppImages.fontPoppins,
                            fontSize: 30.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
