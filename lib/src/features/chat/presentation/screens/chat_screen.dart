import 'package:dialog_dash/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final inputController = TextEditingController();

  String result = '';
  bool isLoading = false;

  tryGenerativeApi({String? prompt}) async {
    if (prompt == null) return;

    const apiKey = String.fromEnvironment('API_KEY', defaultValue: '');
    if (apiKey.isEmpty) return;

    setState(() => result = '');
    setState(() => isLoading = true);

    final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
    final chat = model.startChat(history: [
      Content.text('Hello, I have 2 dogs in my house.'),
      Content.model([
        TextPart('Great to meet you. What would you like to know?'),
      ])
    ]);
    var content = Content.text('How many paws are in my house?');
    var response = await chat.sendMessage(content);

    setState(() => result = response.text ?? '');
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text.rich(
            TextSpan(
              text: 'DialogDash',
              children: [
                WidgetSpan(child: context.spacingXs.hSpace),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.spacingMd,
                      vertical: context.spacingXxs,
                    ),
                    decoration: ShapeDecoration(
                      color: Colors.grey.shade900,
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      'AI',
                      style: context.regular.copyWith(
                        fontSize: context.spacingMd,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.all(context.spacingMd),
            child: isLoading
                ? SizedBox(
                    width: context.spacingXlg,
                    height: context.spacingXlg,
                    child: CircularProgressIndicator(
                      color: context.mindfulGreen,
                      strokeWidth: 3.0,
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(right: context.spacingMd),
                    decoration: BoxDecoration(
                      color: context.mindfulCreamDarker,
                      borderRadius: BorderRadius.only(
                        topRight: context.spacingXlg.radius,
                        bottomLeft: context.spacingXlg.radius,
                        bottomRight: context.spacingXlg.radius,
                      ),
                    ),
                    child: Markdown(data: result, shrinkWrap: true),
                  ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(context.spacingMd),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: context.spacingXlg.borderRadius,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -4),
                color: context.mindfulBrown.withOpacity(0.1),
                spreadRadius: 4,
                blurRadius: 20,
              ),
            ],
          ),
          child: SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: inputController,
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: context.mindfulCream,
                      hintText: 'Type to start chatting...',
                      hintStyle: context.regular.copyWith(
                        color: context.grayRockDarker,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: context.grayRock),
                        borderRadius: context.spacingXlg.borderRadius * 2,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: context.grayRock),
                        borderRadius: context.spacingXlg.borderRadius * 2,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: context.mindfulOrange),
                        borderRadius: context.spacingXlg.borderRadius * 2,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: context.spacingSm,
                        horizontal: context.spacingMd,
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.mic, color: context.mindfulBrown),
                      ),
                    ),
                  ),
                ),
                context.spacingXs.hSpace,
                TextButton(
                  onPressed: () {
                    final prompt = inputController.text.trim();
                    tryGenerativeApi(prompt: prompt);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(context.spacingSm),
                    backgroundColor: context.mindfulGreen,
                  ),
                  child: isLoading
                      ? SizedBox(
                          width: context.spacingXlg,
                          height: context.spacingXlg,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3.0,
                          ),
                        )
                      : const Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.white,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
