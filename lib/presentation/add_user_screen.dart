// // UI Layer
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:zilmoney_machine_test/domain/models/user_model.dart';
//
// class AddUserScreen extends ConsumerStatefulWidget {
//   final UserModel? existingUser;
//
//   const AddUserScreen({Key? key, this.existingUser}) : super(key: key);
//
//   @override
//   ConsumerState<AddUserScreen> createState() => _AddUserScreenState();
// }
//
// class _AddUserScreenState extends ConsumerState<AddUserScreen> {
//   final _formKey = GlobalKey<FormState>();
//   late final TextEditingController _nameController;
//   late final TextEditingController _usernameController;
//   late final TextEditingController _emailController;
//   late final TextEditingController _phoneController;
//   late final TextEditingController _websiteController;
//
//   @override
//   void initState() {
//     super.initState();
//     final user = widget.existingUser;
//     _nameController = TextEditingController(text: user?.name ?? '');
//     _usernameController = TextEditingController(text: user?.username ?? '');
//     _emailController = TextEditingController(text: user?.email ?? '');
//     _phoneController = TextEditingController(text: user?.phone ?? '');
//     _websiteController = TextEditingController(text: user?.website ?? '');
//   }
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _usernameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     _websiteController.dispose();
//     super.dispose();
//   }
//
//   String? _validateRequired(String? value, String field) {
//     if (value?.trim().isEmpty ?? true) return '$field is required';
//     return null;
//   }
//
//   String? _validateEmail(String? value) {
//     if (value?.trim().isEmpty ?? true) return 'Email is required';
//     if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
//       return 'Enter valid email';
//     }
//     return null;
//   }
//
//   void _submitForm() {
//     if (!_formKey.currentState!.validate()) return;
//
//     final user = UserModel(
//       id: widget.existingUser?.id ?? 0,
//       name: _nameController.text.trim(),
//       username: _usernameController.text.trim(),
//       email: _emailController.text.trim(),
//       phone: _phoneController.text.trim(),
//       website: _websiteController.text.trim(),
//     );
//
//     ref.read(userFormProvider.notifier).saveUser(user);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final formState = ref.watch(userFormProvider);
//     final isEdit = widget.existingUser != null;
//
//     ref.listen(userFormProvider, (previous, next) {
//       next.whenOrNull(
//         data: (user) {
//           if (user != null) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(
//                   'User ${isEdit ? 'updated' : 'created'} successfully!',
//                 ),
//               ),
//             );
//             Navigator.pop(context, user);
//           }
//         },
//         error: (error, _) {
//           ScaffoldMessenger.of(
//             context,
//           ).showSnackBar(SnackBar(content: Text('Error: $error')));
//         },
//       );
//     });
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(isEdit ? 'Edit User' : 'Add New User'),
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         controller: _nameController,
//                         decoration: const InputDecoration(
//                           labelText: 'Full Name',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) => _validateRequired(value, 'Name'),
//                       ),
//                       const SizedBox(height: 16),
//                       TextFormField(
//                         controller: _usernameController,
//                         decoration: const InputDecoration(
//                           labelText: 'Username',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator:
//                             (value) => _validateRequired(value, 'Username'),
//                       ),
//                       const SizedBox(height: 16),
//                       TextFormField(
//                         controller: _emailController,
//                         decoration: const InputDecoration(
//                           labelText: 'Email',
//                           border: OutlineInputBorder(),
//                         ),
//                         keyboardType: TextInputType.emailAddress,
//                         validator: _validateEmail,
//                       ),
//                       const SizedBox(height: 16),
//                       TextFormField(
//                         controller: _phoneController,
//                         decoration: const InputDecoration(
//                           labelText: 'Phone',
//                           border: OutlineInputBorder(),
//                         ),
//                         keyboardType: TextInputType.phone,
//                         validator: (value) => _validateRequired(value, 'Phone'),
//                       ),
//                       const SizedBox(height: 16),
//                       TextFormField(
//                         controller: _websiteController,
//                         decoration: const InputDecoration(
//                           labelText: 'Website',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator:
//                             (value) => _validateRequired(value, 'Website'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: formState.isLoading ? null : _submitForm,
//                   child:
//                       formState.isLoading
//                           ? const CircularProgressIndicator()
//                           : Text(isEdit ? 'Update User' : 'Create User'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zilmoney_machine_test/presentation/providers/user_form_provider.dart';

import '../../domain/entities/user_entity.dart';

class UserFormScreen extends ConsumerStatefulWidget {
  final UserEntity? user; // null for add

  const UserFormScreen({super.key, this.user});

  @override
  ConsumerState<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends ConsumerState<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController name;
  late final TextEditingController username;
  late final TextEditingController email;
  late final TextEditingController phone;
  late final TextEditingController website;

  @override
  void initState() {
    super.initState();
    final u = widget.user;
    name = TextEditingController(text: u?.name ?? '');
    username = TextEditingController(text: u?.username ?? '');
    email = TextEditingController(text: u?.email ?? '');
    phone = TextEditingController(text: u?.phone ?? '');
    website = TextEditingController(text: u?.website ?? '');
  }

  @override
  void dispose() {
    name.dispose();
    username.dispose();
    email.dispose();
    phone.dispose();
    website.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final user = UserEntity(
        id: widget.user?.id ?? 0,
        name: name.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phone: phone.text.trim(),
        website: website.text.trim(),
      );

      await ref
          .read(userFormProvider.notifier)
          .submit(user, isEdit: widget.user != null);

      final state = ref.read(userFormProvider);
      state.whenOrNull(
        data: (_) => Navigator.pop(context, true),
        error:
            (e, _) => ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: $e'))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.user != null;
    final formState = ref.watch(userFormProvider);

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit User' : 'Add User')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(labelText: 'Name'),
                validator: _validate,
              ),
              TextFormField(
                controller: username,
                decoration: InputDecoration(labelText: 'Username'),
                validator: _validate,
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(labelText: 'Email'),
                validator: _validate,
              ),
              TextFormField(
                controller: phone,
                decoration: InputDecoration(labelText: 'Phone'),
                validator: _validate,
              ),
              TextFormField(
                controller: website,
                decoration: InputDecoration(labelText: 'Website'),
                validator: _validate,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: formState.isLoading ? null : _submit,
                child: Text(
                  formState.isLoading
                      ? 'Saving...'
                      : isEdit
                      ? 'Update'
                      : 'Create',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _validate(String? value) {
    if (value == null || value.trim().isEmpty) return 'Required';
    return null;
  }
}
