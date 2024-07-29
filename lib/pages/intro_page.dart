import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: theme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/images/on-logo.png',
                color: theme.onSurface,
                height: 200,
              ),
              const SizedBox(height: 25),
              
              const Text(
                'Dream On',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              
              Text(
                'Igniting the human spirit through movement',
                style: TextStyle(
                  color: theme.onPrimary,
                  fontSize: 16.0,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.onSurface,
                  elevation: 0,
                  foregroundColor: theme.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  'Shop Now'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 0.75,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // style: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
