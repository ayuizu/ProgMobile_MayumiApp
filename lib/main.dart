import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'components/colors.dart';
import 'view/home_page.dart';
import 'view/login_page.dart';
import 'view/cadastro_page.dart';
import 'view/agendamento_page.dart';
import 'view/lista_page.dart';
import 'view/profissionais_page.dart';
import 'view/servico_page.dart';
import 'view/sobre_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agendamento de Massagem',
      theme: ThemeData(
        primarySwatch: MaterialColor(AppColor.violet.value, const <int, Color>{
          50: Color(0xFFEEE1F7),
          100: Color(0xFFD7B9ED),
          200: Color(0xFFBB8CE4),
          300: Color(0xFF9E5FE0),
          400: Color(0xFF863CDD),
          500: Color(0xFF6A0DAD),
          600: Color(0xFF6008AC),
          700: Color(0xFF5305AB),
          800: Color(0xFF4703A9),
          900: Color(0xFF3301A6),
        }),
      ),
      // Habilita internacionalização
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      initialRoute: '/login',
      //Define os routes
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginView(),
        '/cadastro': (context) => const CadastroView(),
        '/agendamento': (context) => const AgendamentoView(),
        '/lista': (context) => const FuturosAgendamentosView(),
        '/profissionais': (context) => const ProfissionaisView(),
        '/servicos': (context) => const ServicosView(),
        '/sobre': (context) => const SobreView(),
      },
    );
  }
}
