import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> configureSupabase() async {
  await Supabase.initialize(
    url: 'https://ebeezxtpozvzesoxswpn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImViZWV6eHRwb3p2emVzb3hzd3BuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ3MTI5NDQsImV4cCI6MjA1MDI4ODk0NH0.ZfjFOWoO62GcbujDDqZ26uoh-ZQOmQOAZQO0C2U-WLg',
  );
}
