import 'package:flutter/material.dart';
import 'package:proyecto/Model/User.dart';
import 'package:proyecto/Presentador/UserLogin.dart';
import 'package:proyecto/View/Home.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  List<User> _user = new List();
  @override
  void initState() {
    super.initState();
   // _loadJson();
  }
    onPressButton(){ 
      _loguendo();
    }

   _loguendo() async{
    String data = await UserLogin().autenticando(emailController.text,passwordController.text);
    print(data.toString());
    if(data.toString() == "error"){
      print("ocurrio un error");
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
    }              
  }

 /* _loadJson() async{
    String data = await UserLogin().fetchUser();
    print(data);
  }
*/
 /* void loadUser() async{
    var movies = await UserLogin().fetchUser();
    setState(() {
      _user.addAll(movies);
    });
  }*/


  final String logo = 'assets/img/login.png';
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
  }
 
Widget _loginForm(BuildContext context) {
  

  final size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        SafeArea(
          child: Container(
            height: 120.0,
          ),
        ),
        Container(
          width: size.width * 0.80,
          padding: EdgeInsets.symmetric(vertical: 30.0),
          margin: EdgeInsets.symmetric(vertical: 50.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0)
              ]),
          child: Column(
            children: <Widget>[
              Text('Ingreso', style: TextStyle(fontSize: 20.0)),
              SizedBox(
                height: 20.0,
              ),
              _crearEmail(),
              SizedBox(
                height: 10.0,
              ),
              _crearPassword(),
              SizedBox(
                height: 10.0,
              ),
              _crearBoton(),
              
            ],
          ),
        ),
        GestureDetector(
          child: Text(
            '¿olvido la contraseña?',
            style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
          onTap: () => Navigator.pushNamed(context, 'recuperar'),
        ),
      ],
    ),
  );
}

Widget _crearBoton() {
  return StreamBuilder(
    
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
          child: Text('Ingresar'),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 0.0,
        color: Colors.deepPurple,
        textColor: Colors.white,
        onPressed: onPressButton(),
      );
    },
  );
}




Widget _crearEmail() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              icon: Icon(
                Icons.alternate_email,
                color: Colors.deepPurple,
              ),
              hintText: 'ejemplo@gmail.com',
              labelText: 'Correo Electronico',
              counterText: snapshot.data,
              errorText: snapshot.error),
              controller: emailController,
        ),
      );
    },
  );
}

Widget _crearPassword() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(
                Icons.lock_outline,
                color: Colors.deepPurple,
              ),
              labelText: 'Contraseña',
              counterText: snapshot.data,
              errorText: snapshot.error),
              controller: passwordController,
        ),
      );
    },
  );
}
Widget _crearFondo(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final fondoMorado = Container(
    height: size.height * 0.4,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: <Color>[
          Color.fromRGBO(63, 63, 156, 1.0),
          Color.fromRGBO(90, 70, 178, 1.0)
        ],
      ),
    ),
  );

  final circulo = Container(
    width: 100.0,
    height: 100.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05)),
  );
  return Stack(
    children: <Widget>[
      fondoMorado,
      Positioned(
        top: 50.0,
        left: 30.0,
        child: circulo,
      ),
      Positioned(
        top: -40.0,
        right: -30.0,
        child: circulo,
      ),
      Positioned(
        bottom: -50.0,
        right: -10.0,
        child: circulo,
      ),
      Positioned(
        bottom: 60.0,
        right: 60.0,
        child: circulo,
      ),
      Container(
        padding: EdgeInsets.only(top: 70.0),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.person_pin_circle,
              color: Colors.white,
              size: 80.0,
            ),
            SizedBox(
              height: 10.0,
              width: double.infinity,
            ),
            Text(
              'Elecciones 2019',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ],
        ),
      )
    ],
  );
}

}

