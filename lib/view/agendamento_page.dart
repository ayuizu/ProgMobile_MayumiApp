import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../components/colors.dart';
import '../components/custom_appBar.dart';
import '../components/input_decoration.dart';
import '../components/side_menu.dart';
import '../models/servico.dart';
import '../controller/profissional_controller.dart';

class AgendamentoView extends StatefulWidget {
  const AgendamentoView({Key? key}) : super(key: key);

  @override
  State<AgendamentoView> createState() => _AgendamentoViewState();
}

class _AgendamentoViewState extends State<AgendamentoView> {
  final _firstDay = DateTime.now();
  final _lastDay = DateTime(2030, 12, 31);
  var _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final _formKey = GlobalKey<FormState>();

  String? _selectedProfissional;
  String? _selectedServico;
  String? _selectedHorario; // Alterado para String para os botões

  List<String> _listaProfissionais = [];
  List<Servico> _listaServicos = [];
  final _profissionalController = ProfissionalController();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _loadProfissionais();
  }

  void _loadProfissionais() async {
    await _profissionalController.readAll();
    setState(() {
      _listaProfissionais = _profissionalController.profissionalList
          .map((p) => p.nome)
          .toList();
      _isLoading = false;
    });
  }

  void _onDaySelected(selectedDay, focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _isLoading ? null : _showAgendamentoDialog,
        backgroundColor: AppColor.violet,
        label: const Text(
          'Agendar Serviço',
          style: TextStyle(color: AppColor.white),
        ),
        icon: const Icon(Icons.calendar_month, color: AppColor.white),
      ),
      drawer: const SideMenu(
        selected: [false, true, false, false, false, false],
      ),
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(color: AppColor.violet),
              )
            : ListView(
                children: [
                  const CustomAppBar(texto: 'Agendamento'),
                  _buildCalendar(),
                ],
              ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColor.graphite.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TableCalendar(
        locale: 'pt_BR',
        focusedDay: _focusedDay,
        firstDay: _firstDay,
        lastDay: _lastDay,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: _onDaySelected,
        headerStyle: const HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
            color: AppColor.violet,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          leftChevronIcon: Icon(Icons.chevron_left, color: AppColor.violet),
          rightChevronIcon: Icon(Icons.chevron_right, color: AppColor.violet),
        ),
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          todayDecoration: const BoxDecoration(
            color: AppColor.violet,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: AppColor.violet.withOpacity(0.7),
            shape: BoxShape.circle,
          ),
          defaultTextStyle: const TextStyle(color: AppColor.graphite),
          weekendTextStyle: const TextStyle(color: AppColor.graphite),
          markerDecoration: const BoxDecoration(
            color: AppColor.violet,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Future<void> _showAgendamentoDialog() async {
    // Agora o estado é limpo apenas ao fechar o diálogo.
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Novo Agendamento'),
              content: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Seletor de Profissional
                      DropdownButtonFormField<String>(
                        decoration: inputdecoration('Selecione o Profissional'),
                        value: _selectedProfissional,
                        items: _listaProfissionais.map((nome) {
                          return DropdownMenuItem(
                            value: nome,
                            child: Text(nome),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedProfissional = newValue;
                            _selectedServico = null;
                            if (newValue != null) {
                              final profissional = _profissionalController
                                  .profissionalList
                                  .firstWhere((p) => p.nome == newValue);
                              _listaServicos = profissional.servicos;
                            }
                          });
                        },
                        validator: (value) =>
                            value == null ? 'Campo obrigatório' : null,
                      ),
                      const SizedBox(height: 20),
                      // Seletor de Serviço
                      DropdownButtonFormField<String>(
                        decoration: inputdecoration('Selecione o Serviço'),
                        value: _selectedServico,
                        items: _listaServicos.map((servico) {
                          return DropdownMenuItem(
                            value: servico.nome,
                            child: Text(servico.nome),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedServico = newValue;
                          });
                        },
                        validator: (value) =>
                            value == null ? 'Campo obrigatório' : null,
                      ),
                      const SizedBox(height: 20),
                      // Seletor de Horário com botões
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Selecione o Horário',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.graphite,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: List.generate(12, (index) {
                              // Horários de 8h a 19h
                              final hour = index + 8;
                              final time =
                                  '${hour.toString().padLeft(2, '0')}:00';
                              final isLunchTime = hour == 12;

                              return ElevatedButton(
                                onPressed: isLunchTime
                                    ? null
                                    : () {
                                        setState(() {
                                          _selectedHorario = time;
                                        });
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _selectedHorario == time
                                      ? AppColor.violet
                                      : AppColor.lightGrey,
                                  foregroundColor: _selectedHorario == time
                                      ? AppColor.white
                                      : AppColor.graphite,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  side: BorderSide(
                                    color: isLunchTime
                                        ? AppColor.lightGrey
                                        : AppColor.graphite,
                                  ),
                                ),
                                child: Text(time),
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    // Limpa o estado ao cancelar o diálogo
                    _selectedProfissional = null;
                    _selectedServico = null;
                    _selectedHorario = null;
                    _listaServicos = [];
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: AppColor.graphite),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _selectedHorario != null) {
                      final selectedDateString = DateFormat(
                        'dd/MM/yyyy',
                      ).format(_selectedDay!);

                      // TODO: Adicionar lógica para salvar o agendamento
                      print('Agendamento:');
                      print('Profissional: $_selectedProfissional');
                      print('Serviço: $_selectedServico');
                      print('Data: $selectedDateString');
                      print('Horário: $_selectedHorario');
                      Navigator.of(context).pop();
                    } else if (_selectedHorario == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Por favor, selecione um horário.'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.violet,
                  ),
                  child: const Text(
                    'Agendar',
                    style: TextStyle(color: AppColor.white),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
