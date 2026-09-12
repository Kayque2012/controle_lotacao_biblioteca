import 'package:flutter/material.dart';

import '../models/ambiente.dart';

class ControleLotacaoPage extends StatefulWidget {
  const ControleLotacaoPage({super.key});

  @override
  State<ControleLotacaoPage> createState() => _ControleLotacaoPageState();
}

class _ControleLotacaoPageState extends State<ControleLotacaoPage> {
  final Ambiente _ambiente = Ambiente.biblioteca();

  Color get _corSituacao {
    if (_ambiente.estaLotado) {
      return const Color(0xFFB3261E);
    }
    if (_ambiente.estaQuaseCheio) {
      return const Color(0xFFE07800);
    }
    return const Color(0xFF217A46);
  }

  IconData get _iconeSituacao {
    if (_ambiente.estaLotado) {
      return Icons.block;
    }
    if (_ambiente.estaQuaseCheio) {
      return Icons.warning_amber_rounded;
    }
    return Icons.check_circle_outline;
  }

  void _registrarEntrada() {
    final entrou = _ambiente.entrar();
    setState(() {});
    if (!entrou) {
      _mostrarAviso('A capacidade máxima já foi atingida.');
    }
  }

  void _registrarSaida() {
    final saiu = _ambiente.sair();
    setState(() {});
    if (!saiu) {
      _mostrarAviso('Não há pessoas para registrar a saída.');
    }
  }

  void _mostrarAviso(String mensagem) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(mensagem)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B3A29),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(_ambiente.nome),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 210,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x22000000),
                      blurRadius: 12,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/biblioteca.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Pessoas no local',
                      style: TextStyle(fontSize: 18, color: Color(0xFF6B625C)),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${_ambiente.quantidadePessoas}',
                      style: const TextStyle(
                        fontSize: 64,
                        height: 1,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D201A),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Capacidade máxima: ${_ambiente.capacidadeMaxima} pessoas',
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 18),
                    LinearProgressIndicator(
                      value: _ambiente.percentualOcupacao,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                      color: _corSituacao,
                      backgroundColor: const Color(0xFFE7DDD4),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                decoration: BoxDecoration(
                  color: _corSituacao.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: _corSituacao, width: 1.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_iconeSituacao, color: _corSituacao),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        _ambiente.mensagemSituacao,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _corSituacao,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: _registrarSaida,
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF8D2D2D),
                        backgroundColor: const Color(0xFFFDE9E7),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Saiu',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: TextButton(
                      onPressed: _registrarEntrada,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF5B3A29),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Entrou',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
