import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Asegúrate de que estas rutas sean correctas en tu proyecto
import 'package:imc/core/colores.dart';
import 'package:imc/pages/page_ayuda.dart';
import 'package:imc/pages/page_principal.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _indiceNavBar = 0;

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (_indiceNavBar == 2) _indiceNavBar = 0;
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Usamos el Builder para obtener un contexto válido para el showDialog
      theme: ThemeData(
        scaffoldBackgroundColor: Colores.fondoSecundario,
        scrollbarTheme: ScrollbarThemeData(
          // Color de la barra
          thumbColor: WidgetStateProperty.all(Colores.violeta),
          // Si quieres que siempre sea visible o solo al hacer scroll
          thumbVisibility: WidgetStateProperty.all(true),
          // Grosor de la barra
          thickness: WidgetStateProperty.all(8),
          // Bordes redondeados
          radius: const Radius.circular(12),
        ),
      ),
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              actionsPadding: const EdgeInsets.all(
                10,
              ), // Corregido: agregado EdgeInsets
              title: const Text('IMC Calculator'),
              backgroundColor: Colores.appbarFondo,
              foregroundColor: Colores.textoSecundario,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colores.textoSecundario,
                          title: const Text('¿Salir de la aplicación?'),
                          content: const Text(
                            '¿Estás seguro de que quieres cerrar la app?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () => SystemNavigator.pop(),
                              child: const Text(
                                'Salir',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.exit_to_app),
                ),
              ],
            ),

            body: const PagePrincipal(),

            bottomNavigationBar: NavigationBar(
              onDestinationSelected: (value) {
                setState(() {
                  _indiceNavBar = value;
                  if (_indiceNavBar == 2) {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        opaque: true,
                        pageBuilder: (context, _, _) => PageAyuda(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                      ),
                    );
                  }
                });
              },
              indicatorColor: Colores.violeta,
              indicatorShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              selectedIndex: _indiceNavBar,
              labelTextStyle: WidgetStateProperty.all(
                TextStyle(color: Colores.textoSecundario),
              ),
              backgroundColor: Colores.appbarFondo,
              elevation: 0,
              destinations: [
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.home,
                    color: const Color(0xFF000000),
                  ),
                  icon: Icon(Icons.home, color: Colores.textoSecundario),
                  label: 'Inicio',
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings, color: Colores.textoSecundario),
                  selectedIcon: Icon(
                    Icons.settings,
                    color: const Color(0xFF000000),
                  ),
                  label: 'Opciones',
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.help,
                    color: const Color(0xFF000000),
                  ),
                  icon: Icon(Icons.help, color: Colores.textoSecundario),
                  label: 'Ayuda',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
