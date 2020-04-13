import 'package:compound/ui/shared/ui_helpers.dart';
import 'package:compound/ui/view/signup_view.dart';
import 'package:compound/ui/widgets/busy_button.dart';
import 'package:compound/ui/widgets/input_field.dart';
//import 'package:compound/ui/widgets/text_link.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:compound/viewmodels/login_view_model.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withConsumer(
        viewModel: LoginViewModel(),
        builder: (context, model, child) =>
            Scaffold(
              backgroundColor: Colors.white,
              appBar: new AppBar(
                title: new Text('Login',
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
              ),
              body: new Container(
                  padding: EdgeInsets.all(16.0),
                  child: new ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                          child:
                            CircleAvatar(
                            backgroundColor: Colors.transparent,
                              radius: 20.0,
                              child: new Icon(
                                  Icons.local_hospital, color: Colors.red,
                                  size: 150.0),
                            ),
                        ),
                        verticalSpaceLarge,
                        verticalSpaceLarge,
                        verticalSpaceSmall,
                        Text("TO THE RESCUE", textAlign: TextAlign.center, style: TextStyle(
                              fontSize: 30.0, color: Colors.redAccent, fontWeight: FontWeight.bold),
                          ),
                        verticalSpaceLarge,
                        InputField(
                          placeholder: 'Email',
                          controller: emailController,
                        ),
                        verticalSpaceSmall,
                        InputField(
                          placeholder: 'Password',
                          password: true,
                          controller: passwordController,
                        ),
                        verticalSpaceMedium,
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            BusyButton(
                              title: 'Login',
                              busy: model.busy,
                              onPressed: () {
                                model.login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              },
                            )
                          ],
                        ),
                        verticalSpaceMedium,

                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                          child: SizedBox(
                            height: 40.0,
                            child: new RaisedButton(
                              elevation: 5.0,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0)),
                              color: Colors.green,
                              child: new Text('Click Here',
                                  style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => SignUpView()));
                              },),
                            ),
                          ),
                        verticalSpaceSmall,

                        Text('To Create an Account if you\'re new',textAlign: TextAlign.center),

                      ]
                  )
              ),
            ),
    );
  }
}

