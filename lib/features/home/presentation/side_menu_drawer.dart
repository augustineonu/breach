import 'package:breach/core/constants/app_assets.dart';
import 'package:breach/core/constants/app_colors.dart';
import 'package:breach/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideMenuDrawer extends StatelessWidget {
  const SideMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Header Section
              const DrawerHeader(),

              // Start Writing Button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 10,
                ),
                child: AppButton(
                  label: "Start writing",
                  onPressed: () {},
                  minimumSize: Size(MediaQuery.of(context).size.width, 40.h),
                ),
              ),

              // Menu Items
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  children: [
                    DrawerMenuItem(
                      icon: Icons.home_outlined,
                      title: "Home",
                      isActive: true,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    DrawerMenuItem(
                      icon: Icons.dashboard_outlined,
                      title: "Dashboard",
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to dashboard
                      },
                    ),
                    DrawerMenuItem(
                      icon: Icons.article_outlined,
                      title: "Publications",
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to publications
                      },
                    ),

                    // Divider
                    const DrawerDivider(),

                    // Categories Section
                    const DrawerSectionHeader(title: "Categories"),

                    DrawerMenuItem(
                      icon: Icons.trending_up,
                      title: "Popular",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    DrawerMenuItem(
                      icon: Icons.schedule,
                      title: "Recent",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    DrawerMenuItem(
                      icon: Icons.star_outline,
                      title: "Featured",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    DrawerMenuItem(
                      icon: Icons.bookmark_outline,
                      title: "Bookmarks",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),

                    // Another divider
                    const DrawerDivider(),

                    // Topics Section
                    const DrawerSectionHeader(title: "Topics"),

                    DrawerMenuItem(
                      icon: Icons.psychology_outlined,
                      title: "Science",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    DrawerMenuItem(
                      icon: Icons.business_outlined,
                      title: "Business",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    DrawerMenuItem(
                      icon: Icons.palette_outlined,
                      title: "Art",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    DrawerMenuItem(
                      icon: Icons.sports_basketball_outlined,
                      title: "Sports",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    DrawerMenuItem(
                      icon: Icons.currency_bitcoin,
                      title: "Crypto",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),

              // Footer Section
              const DrawerFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable Drawer Header Widget
class DrawerHeader extends StatelessWidget {
  const DrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Color(0xffFCFAFF),
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppAssets.breachLogo, width: 100.w, height: 20.h),
          SizedBox(height: 16.h),
          Text(
            "Discover great ideas",
            style: TextStyle(fontSize: 16.sp, color: AppColors.textSecondary),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}

// Reusable Drawer Menu Item Widget
class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const DrawerMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 22.sp,
        color: isActive ? AppColors.primary : AppColors.textSecondary,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          color: isActive ? AppColors.primary : AppColors.textSecondary,
        ),
      ),
      onTap: onTap,
      selected: isActive,
      selectedTileColor: AppColors.primary.withOpacity(0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
      horizontalTitleGap: 16.w,
    );
  }
}

// Reusable Drawer Section Header Widget
class DrawerSectionHeader extends StatelessWidget {
  final String title;

  const DrawerSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondary,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

// Reusable Drawer Divider Widget
class DrawerDivider extends StatelessWidget {
  const DrawerDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Divider(color: Colors.grey.shade200, thickness: 1),
    );
  }
}

// Reusable Drawer Footer Widget
class DrawerFooter extends StatelessWidget {
  const DrawerFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      child: Column(
        children: [
          SizedBox(height: 12.h),

          // Settings and Help
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DrawerFooterButton(
                icon: Icons.settings_outlined,
                title: "Settings",
                onTap: () {
                  Navigator.pop(context);
                  // Handle settings
                },
              ),
              DrawerFooterButton(
                icon: Icons.help_outline,
                title: "Help",
                onTap: () {
                  Navigator.pop(context);
                  // Handle help
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Reusable Drawer Footer Button Widget
class DrawerFooterButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerFooterButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 16.sp, color: AppColors.textSecondary),
      label: Text(
        title,
        style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
      ),
    );
  }
}
