import 'package:flutter/material.dart';
import 'package:rang/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //text field state
  String email = '';
  String password = '';
  String error = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: (){
              widget.toggleView();
            }
            )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0, horizontal:50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height:20),
              TextFormField(
                decoration:  InputDecoration(
                  hintText: 'Email'
                ),
                validator: (val)=> val.isEmpty ? 'Enter an email' : null ,
                onChanged: (val){
                  setState(()=> email = val);
                } 
              ),
              SizedBox(height:20),
              TextFormField(
                decoration:  InputDecoration(
                  hintText: 'Password'
                ),
                validator: (val)=> val.length<6 ? 'Enter a password 6+ chars long' : null ,
                obscureText: true,
                onChanged:(val) {
                  setState(()=> password = val);
                }
                ),
                SizedBox(height:20),
                RaisedButton(
                  child: Text('Sign in'),
                  onPressed: () async{
                   if(_formKey.currentState.validate()){
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    print('valid');
                    if(result==null){
                      setState(()=> error = 'Could not sign in with those credentials');
                   }
                    }
                  }
                ),
                SizedBox(height:12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
            ],
          ), 
        ),
      ),
      );
  }
}