import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int _selectedRating = 5;
  String _selectedEmojiText = '😊';
  final TextEditingController _commentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final List<Map<String, dynamic>> _ratingOptions = [
    {'rating': 1, 'emoji': '😞', 'label': 'Very Poor'},
    {'rating': 2, 'emoji': '😟', 'label': 'Poor'},
    {'rating': 3, 'emoji': '😐', 'label': 'Average'},
    {'rating': 4, 'emoji': '🙂', 'label': 'Good'},
    {'rating': 5, 'emoji': '😊', 'label': 'Excellent'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildStatusBar(),
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildEmojiDisplay(),
                      const SizedBox(height: 24),
                      _buildRatingOptions(),
                      const SizedBox(height: 24),
                      _buildCommentField(),
                      const SizedBox(height: 24),
                      _buildSubmitButton(),
                      const SizedBox(height: 16),
                      _buildThankYouNote(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBar() => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF7960F), Color(0xFFFF8C00)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('9:41', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
            Row(
              children: [
                Row(
                  children: List.generate(4, (i) => Container(
                        width: 4,
                        height: 12,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(i < 3 ? 1 : 0.7),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      )),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.wifi, color: Colors.white, size: 16),
                const SizedBox(width: 4),
                Container(
                  width: 24,
                  height: 12,
                  decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(4)),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _buildHeader() => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF7960F), Color(0xFFFF8C00)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            GestureDetector(onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back, color: Colors.white, size: 24)),
            const SizedBox(width: 16),
            const Text('Feedback', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
          ],
        ),
      );

  Widget _buildEmojiDisplay() => Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(_selectedEmojiText, style: const TextStyle(fontSize: 48)),
            const Positioned(top: -4, left: -4, child: Icon(Icons.star, color: Color(0xFFFB923C), size: 12)),
            const Positioned(top: -8, left: 50, child: Icon(Icons.star, color: Color(0xFFFB923C), size: 16)),
            const Positioned(top: 10, right: -8, child: Icon(Icons.star, color: Color(0xFFFB923C), size: 14)),
          ],
        ),
      );

  Widget _buildRatingOptions() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('How was your trip experience?', style: TextStyle(color: Color(0xFF111827), fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _ratingOptions.map((opt) {
              final isSelected = _selectedRating == opt['rating'];
              return GestureDetector(
                onTap: () => setState(() {
                  _selectedRating = opt['rating'];
                  _selectedEmojiText = opt['emoji'];
                }),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFF97316).withOpacity(0.1) : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: isSelected ? const Color(0xFFF97316) : const Color(0xFFE5E7EB)),
                  ),
                  child: Column(children: [
                    Text(opt['emoji'], style: const TextStyle(fontSize: 24)),
                    const SizedBox(height: 4),
                    Text(opt['rating'].toString(), style: TextStyle(color: isSelected ? const Color(0xFFF97316) : const Color(0xFF6B7280), fontSize: 12, fontWeight: FontWeight.w500)),
                  ]),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
          Center(child: Text(
            _ratingOptions.firstWhere((o) => o['rating'] == _selectedRating)['label'],
            style: const TextStyle(color: Color(0xFF4B5563), fontSize: 14, fontWeight: FontWeight.w500),
          )),
        ],
      );

  Widget _buildCommentField() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tell us more about your experience', style: TextStyle(color: Color(0xFF374151), fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          TextFormField(
            controller: _commentController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Share your thoughts about the bus service, comfort, timing, or any suggestions...',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFF97316))),
              contentPadding: const EdgeInsets.all(12),
            ),
          ),
        ],
      );

  Widget _buildSubmitButton() => SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: _isLoading ? null : _handleSubmitFeedback,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: EdgeInsets.zero,
          ),
          child: Ink(
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFFF7960F), Color(0xFFFF8C00)]),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                  : const Text('Submit Feedback', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
            ),
          ),
        ),
      );

  Widget _buildThankYouNote() => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: const [
            Icon(Icons.favorite, color: Color(0xFFF97316), size: 16),
            SizedBox(width: 8),
            Expanded(
              child: Text('Your feedback helps us improve our service. Thank you!', style: TextStyle(color: Color(0xFF4B5563), fontSize: 12, fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      );

  void _handleSubmitFeedback() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Thank you for your feedback! We appreciate your input.'), backgroundColor: Color(0xFF10B981)),
      );
      Future.delayed(const Duration(seconds: 1), () {
        _commentController.clear();
        setState(() {
          _selectedRating = 5;
          _selectedEmojiText = '😊';
        });
      });
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
