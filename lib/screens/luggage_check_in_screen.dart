import 'package:flutter/material.dart';

class LuggageCheckInScreen extends StatefulWidget {
  const LuggageCheckInScreen({super.key});

  @override
  _LuggageCheckInScreenState createState() => _LuggageCheckInScreenState();
}

class _LuggageCheckInScreenState extends State<LuggageCheckInScreen> {
  String _selectedLuggageType = 'Suitcase';
  String _selectedWeight = 'Light (under 10kg)';
  String _selectedPriority = 'Standard';
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  static const List<String> _luggageTypes = [
    'Suitcase',
    'Backpack',
    'Duffle Bag',
    'Carry-on',
    'Sports Equipment',
    'Musical Instrument',
    'Other',
  ];

  static const List<String> _weightOptions = [
    'Light (under 10kg)',
    'Medium (10-20kg)',
    'Heavy (20-30kg)',
    'Extra Heavy (over 30kg)',
  ];

  static const List<String> _priorityOptions = [
    'Standard',
    'Priority',
    'Express',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://2ac212472ec64c4582e1703c57c9c27f-b99b23cf3e5141f3b8ba63a73.fly.dev/orange-bg.svg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 448),
              height: 650,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  // Header section with background image
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://cdn.builder.io/api/v1/image/assets%2F47bedcd915494a2c9d8c3faf11622396%2F6ee3345d560641f1bc37df16062b7293',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 11),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Icon(Icons.arrow_back, color: Colors.white, size: 24),
                          ),
                        ),
                        const SizedBox(width: 33),
                        const Text(
                          'Luggage Check-In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Content section
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      transform: Matrix4.translationValues(0, -16, 0),
                      child: Column(
                        children: [
                          // Secondary header
                          Container(
                            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: const Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(Icons.arrow_back, color: Color(0xFF020817), size: 24),
                                  ),
                                ),
                                const SizedBox(width: 37),
                                const Text(
                                  'Luggage Check-In',
                                  style: TextStyle(
                                    color: Color(0xFF020817),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Form section
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(16),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 15,
                                    offset: const Offset(0, 10),
                                  ),
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 6,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildDropdown('Luggage Type', _selectedLuggageType, _luggageTypes, (v) => setState(() => _selectedLuggageType = v!)),
                                    const SizedBox(height: 20),
                                    _buildDropdown('Weight Category', _selectedWeight, _weightOptions, (v) => setState(() => _selectedWeight = v!)),
                                    const SizedBox(height: 20),
                                    _buildDropdown('Priority Level', _selectedPriority, _priorityOptions, (v) => setState(() => _selectedPriority = v!)),
                                    const SizedBox(height: 24),
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF3F4F6),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: const [
                                          Icon(Icons.info_outline, color: Color(0xFF6B7280), size: 20),
                                          SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              'Please ensure your luggage is properly labeled and within weight limits.',
                                              style: TextStyle(
                                                color: Color(0xFF4B5563),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                height: 1.33,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    _buildCheckInButton(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String value, List<String> items, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF374151),
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.43,
          ),
        ),
        const SizedBox(height: 4),
        DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFD1D5DB))),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFD1D5DB))),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFF97316))),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          style: const TextStyle(color: Color(0xFF020817), fontSize: 14, height: 1.43),
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildCheckInButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleCheckIn,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.zero,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFFF7960F), Color(0xFFFF8C00)], begin: Alignment.centerLeft, end: Alignment.centerRight),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: _isLoading
                ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                : const Text('Check-In Luggage', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }

  void _handleCheckIn() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Luggage checked in successfully! Check your email for confirmation.', style: TextStyle(color: Colors.white)),
            backgroundColor: Color(0xFF10B981),
          ),
        );
        Future.delayed(const Duration(seconds: 2), () => Navigator.pop(context));
      });
    }
  }
}
