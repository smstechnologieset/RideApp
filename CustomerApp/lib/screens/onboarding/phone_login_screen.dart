import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/state/demo_store.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/brand_logo.dart';
import '../../widgets/demo_notice.dart';
import 'otp_verification_screen.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});
  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final _form = GlobalKey<FormState>();
  final _phone = TextEditingController(text: '911234567');

  @override
  void dispose() {
    _phone.dispose();
    super.dispose();
  }

  void _continue() {
    if (!_form.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => OtpVerificationScreen(
          phoneNumber: DemoStore.normalizePhone(_phone.text)!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 10, 24, 28),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandLogo(size: 80),
              const SizedBox(height: 24),
              Text(
                'Welcome to ZemenGo',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Your city. Your next ride.\nStart with your mobile number.',
                style: TextStyle(
                  color: AppColors.onSurfaceVariant,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 28),
              const DemoNotice(
                text:
                    'Presentation demo · No SMS will be sent. Use code 8429 on the next screen.',
              ),
              const SizedBox(height: 24),
              TextFormField(
                key: const Key('phone_input'),
                controller: _phone,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+ ]')),
                ],
                decoration: const InputDecoration(
                  labelText: 'Ethiopian mobile number',
                  prefixText: '+251  ',
                  hintText: '911234567',
                ),
                validator: (value) =>
                    DemoStore.normalizePhone(value ?? '') == null
                    ? 'Enter a valid 9-digit mobile number starting with 7 or 9.'
                    : null,
                onFieldSubmitted: (_) => _continue(),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _continue,
                child: const Text('Continue'),
              ),
              const SizedBox(height: 22),
              const Text(
                'Demo sign-in is local to this device. It does not create a live customer account.',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.outline,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
