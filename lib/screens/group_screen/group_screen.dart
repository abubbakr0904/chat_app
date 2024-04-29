import 'package:chat_app/bloc/message_bloc/message_event.dart';
import 'package:chat_app/bloc/message_bloc/message_state.dart';
import 'package:chat_app/data/models/message_model/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/message_bloc/message_bloc.dart';
import '../../utils/images/app_images.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  TextEditingController message = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<MessageBloc, MessageState>(
      builder: (context, state) {
        if(state is MessageSuccessState){
          List<MessageModel> messages = state.users;
          return Column(
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
                      Icon(
                        Icons.menu_outlined,
                        color: Colors.black,
                        size: 20.sp,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) => Container(
                    width: 200.w,
                    margin: EdgeInsets.all(15.w),
                    padding: EdgeInsets.all(15.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Colors.black, width: 1.sp),
                        color : user!.email == messages[index].email ? Colors.black.withOpacity(0.8) : Colors.black.withOpacity(0.4)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          messages[index].email,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppImages.fontPoppins,
                            fontSize: 10.sp,
                          ),
                        ),
                        Text(
                          messages[index].text,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppImages.fontPoppins,
                            fontSize: 20.sp,
                          ),
                        ),
                        Text(
                          messages[index].time,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppImages.fontPoppins,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(15.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity - 80,
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                            controller: message,
                            decoration: InputDecoration(
                              hintText: "Write Message",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2.w,
                                  color: Colors.black,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2.w,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            context.read<MessageBloc>().add(
                              AddMessageFireStoreEvent(
                                messageModell: MessageModel(
                                  email: user!.email.toString(),
                                  text: message.text,
                                  time: "${DateTime.now().hour.toString()} : ${DateTime.now().minute.toString()}",
                                ),
                              ),
                            );
                            message.clear();
                          },
                          icon: Icon(
                            Icons.send,
                            color: Colors.black,
                            size: 30.sp,
                          ))
                    ],
                  ))
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    ));
  }
}
