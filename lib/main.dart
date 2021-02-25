import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(home: FormularioTransferencia());
  }
}

class Header extends AppBar {
  Header(String titulo) : super(title: Text(titulo));
}

class ListaDeTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header('transferência'),
        body: Column(children: [
          ItemTransferencia(Transferencia(100, 120202)),
          ItemTransferencia(Transferencia(2999, 4949494)),
          ItemTransferencia(Transferencia(399, 4949494)),
          ItemTransferencia(Transferencia(399, 4949494)),
          ItemTransferencia(Transferencia(349, 4949494)),
          ItemTransferencia(Transferencia(349, 4949494)),
        ]));
  }
}
/**
 * Método para a criação de campos de formulpario
 */
class	CampoFormulario	extends	StatelessWidget	{
  	TextEditingController	_controlador;
  	String	_rotulo;
  	String	_dica;
   IconData icone;
   TextInputType teclado;
  CampoFormulario(this._controlador,	this._rotulo,	this._dica, this.icone, this.teclado);
  @override
  Widget	build(BuildContext	context)	{
    return	Padding(
      padding:	const	EdgeInsets.all(16.0),
      child:	TextField(
        controller:	_controlador,
        style:	TextStyle(
          fontSize:	24.0,
        ),
        decoration:	InputDecoration(
          labelText:	_rotulo,
          hintText:	_dica,
          icon: icone != null ? Icon(icone): null,
        ),
        keyboardType:	teclado != null ? teclado : TextInputType.number,
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
  @override
  String	toString()	{
    return	'Transferencia{valor:	$valor,	numeroConta:	$numeroConta}';
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _tranferencia;

  ItemTransferencia(this._tranferencia);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_tranferencia.valor.toString()),
          subtitle: Text(_tranferencia.numeroConta.toString())),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final	TextEditingController	controladorCampoNumeroConta	=	TextEditingController();
  final	TextEditingController	controladorCampoValor	=	TextEditingController();

  @override
  Widget	build(BuildContext	context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando	Transferência'),
        ),
        body: Column(
            children: <Widget>[
              CampoFormulario(
                controladorCampoNumeroConta,
                "Número da Conta",
                "0000",
                null,
                null,
              ),
              CampoFormulario(
                controladorCampoValor,
                "valor da Transferência",
                "0000",
                Icons.monetization_on,
                null,
              ),

              Builder(builder: (ctx) =>
                  RaisedButton(
                      child: Text("Enviar a transferência"),
                      onPressed: () =>_criarTransferencia(ctx),
                  )
                  )
            ]
        )
    );
  }
  void	_criarTransferencia(context)	{
    final	int	numeroConta	=	int.tryParse(controladorCampoNumeroConta.text);
    final	double	valor	=	double.tryParse(controladorCampoValor.text);
    if(numeroConta	!=	null	&&	valor	!=	null)	{
      final	transferenciaCriada	=	Transferencia(valor,	numeroConta);
      debugPrint('$transferenciaCriada');
      Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('$transferenciaCriada'),
          ));
    }
  }
}
