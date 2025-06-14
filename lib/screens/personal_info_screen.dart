import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final TextEditingController _nameController = TextEditingController(text: 'James Rodriguez');
  final TextEditingController _emailController = TextEditingController(text: 'Jamesrodriguez@gmail.com');
  final TextEditingController _passwordController = TextEditingController(text: '••••••••');
  final TextEditingController _phoneController = TextEditingController(text: '+1 234 567 8900');
  bool _isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String _profileImageUrl =
      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeaderBackground(),
            Expanded(child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderBackground() => Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://2ac212472ec64c4582e1703c57c9c27f-b99b23cf3e5141f3b8ba63a73.fly.dev/orange-bg.svg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 16),
            const Text(
              'My Account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );

  Widget _buildContent() => Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 448),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          transform: Matrix4.translationValues(0, -12, 0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              _buildProfileImage(),
              Expanded(child: _buildForm()),
            ],
          ),
        ),
      );

  Widget _buildProfileImage() => Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
        child: Stack(
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 4),
                borderRadius: BorderRadius.circular(48),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 15, offset: const Offset(0, 10)),
                  BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6, offset: const Offset(0, 4)),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(48),
                child: Image.network(_profileImageUrl, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: _handleProfilePictureEdit,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 15, offset: const Offset(0, 10)),
                      BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: const Icon(Icons.camera_alt, color: Colors.white, size: 16),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildForm() => SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(label: 'Name', controller: _nameController, validator: (v) => v!.isEmpty ? 'Please enter your name' : null),
              const SizedBox(height: 12),
              _buildTextField(label: 'Email Address', controller: _emailController, keyboardType: TextInputType.emailAddress, validator: (v) {
                if (v == null || v.isEmpty) return 'Please enter your email';
                if (!v.contains('@')) return 'Please enter a valid email';
                return null;
              }),
              const SizedBox(height: 12),
              _buildTextField(label: 'Phone Number', controller: _phoneController, keyboardType: TextInputType.phone, validator: (v) => v!.isEmpty ? 'Please enter your phone number' : null),
              const SizedBox(height: 12),
              _buildPasswordField(),
              const SizedBox(height: 24),
              _buildSaveButton(),
            ],
          ),
        ),
      );

  Widget _buildTextField({required String label, required TextEditingController controller, TextInputType? keyboardType, String? Function(String?)? validator}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF374151), fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFF97316))),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            validator: validator,
          ),
        ],
      );

  Widget _buildPasswordField() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Password', style: TextStyle(color: Color(0xFF374151), fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          TextFormField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFF97316))),
              contentPadding: const EdgeInsets.only(left: 12, right: 40, top: 8, bottom: 8),
              suffixIcon: IconButton(
                icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility, color: const Color(0xFF6B7280), size: 16),
                onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
              ),
            ),
            validator: (v) => v!.isEmpty ? 'Please enter your password' : null,
          ),
        ],
      );

  Widget _buildSaveButton() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _handleSave,
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: _isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text('Save Changes', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
        ),
      );

  void _handleProfilePictureEdit() {
    showModalBottomSheet(context: context, builder: (_) {
      return Column(mainAxisSize: MainAxisSize.min, children: [
        const ListTile(leading: Icon(Icons.camera_alt), title: Text('Take Photo')),
        const ListTile(leading: Icon(Icons.photo_library), title: Text('Choose from Gallery')),
        ListTile(leading: const Icon(Icons.delete, color: Colors.red), title: const Text('Remove Photo', style: TextStyle(color: Colors.red)), onTap: () {
          Navigator.pop(context);
          setState(() => _profileImageUrl = 'https://via.placeholder.com/150x150?text=No+Image');
        }),
      ]);
    });
  }

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Personal information updated successfully!'), backgroundColor: Color(0xFF10B981)));
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
