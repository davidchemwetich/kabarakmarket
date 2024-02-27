import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileCards extends StatelessWidget {
  const ProfileCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCard(context, Icons.shopping_basket_rounded,
                      "Advertise", "/upload"),
                  _buildCard(context, Icons.work_history_rounded, "Post Jobs",
                      "/hello"),
                  _buildCard(context, Icons.apartment_sharp, "Apartment",
                      "/UploadApart"),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCard(context, Icons.settings, "Settings", "/settings"),
                  _buildCard(
                      context, Icons.email_rounded, "Contact Me", "/hello"),
                  _buildCard(context, Icons.upcoming, "Updates", "/world"),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, IconData icon, String title, String route) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go(route);
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
