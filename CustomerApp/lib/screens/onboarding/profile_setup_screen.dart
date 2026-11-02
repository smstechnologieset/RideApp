import 'package:flutter/material.dart';
import '../../core/state/demo_store.dart';
import '../../widgets/brand_logo.dart';
import '../home/main_shell_screen.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key, this.editing = false});
  final bool editing;
  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  bool _initialized = false;
  bool _saving = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;
    final store = DemoScope.of(context);
    _name.text = store.name;
    _email.text = store.email;
    _phone.text = store.phone;
    _initialized = true;
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_saving || !_form.currentState!.validate()) return;
    setState(() => _saving = true);
    await DemoScope.of(context).saveProfile(
      name: _name.text,
      email: _email.text,
      phone: widget.editing ? DemoStore.normalizePhone(_phone.text) : null,
    );
    if (!mounted) return;
    if (widget.editing) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const MainShellScreen()),
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.editing ? 'Edit profile' : 'Make it yours'),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandLogo(size: 76),
              const SizedBox(height: 24),
              Text(
                'What should we call you?',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Your demo profile and trips are saved on this phone.',
              ),
              const SizedBox(height: 28),
              TextFormField(
                key: const Key('profile_name'),
                controller: _name,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(labelText: 'Full name'),
                validator: (value) =>
                    (value ?? '').trim().length < 2 ? 'Enter your name.' : null,
              ),
              const SizedBox(height: 18),
              if (widget.editing) ...[
                TextFormField(
                  controller: _phone,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    helperText: 'Local demo profile · No SMS verification',
                  ),
                  validator: (value) =>
                      DemoStore.normalizePhone(value ?? '') == null
                      ? 'Enter a valid Ethiopian phone number.'
                      : null,
                ),
                const SizedBox(height: 18),
              ],
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email (optional)',
                ),
                validator: (value) =>
                    (value ?? '').isEmpty ||
                        RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(value!)
                    ? null
                    : 'Enter a valid email address.',
              ),
              const SizedBox(height: 28),
              ElevatedButton(
                onPressed: _saving ? null : _save,
                child: Text(
                  _saving
                      ? 'Saving…'
                      : widget.editing
                      ? 'Save profile'
                      : 'Start exploring',
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
