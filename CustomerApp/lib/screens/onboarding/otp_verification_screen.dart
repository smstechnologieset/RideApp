import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/state/demo_store.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/demo_notice.dart';
import 'profile_setup_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _code = TextEditingController();
  final _form = GlobalKey<FormState>();
  @override
  void dispose() {
    _code.dispose();
    super.dispose();
  }

  void _verify() {
    if (!_form.currentState!.validate()) return;
    DemoScope.of(context).phone = widget.phoneNumber;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const ProfileSetupScreen()),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Verify your number')),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.sms_outlined,
                size: 52,
                color: AppColors.primary,
              ),
              const SizedBox(height: 24),
              Text(
                'One step closer',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Continue as ${widget.phoneNumber}',
                style: const TextStyle(color: AppColors.onSurfaceVariant),
              ),
              const SizedBox(height: 24),
              const DemoNotice(
                text:
                    'Demo verification code: 8429\nNo SMS or live authentication is used.',
              ),
              const SizedBox(height: 28),
              TextFormField(
                key: const Key('demo_otp'),
                controller: _code,
                autofocus: true,
                keyboardType: TextInputType.number,
                maxLength: 4,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: const TextStyle(fontSize: 28, letterSpacing: 12),
                decoration: const InputDecoration(
                  labelText: 'Four-digit demo code',
                  counterText: '',
                ),
                validator: (value) => value == DemoStore.otp
                    ? null
                    : 'Use the demo code 8429 to continue.',
                onFieldSubmitted: (_) => _verify(),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _verify,
                child: const Text('Verify & Continue'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Change phone number'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
