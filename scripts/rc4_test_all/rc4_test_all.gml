///@func rc4_test_all()
var time_a, time_b;
time_a = current_time;
repeat (100) rc4_test_buffer();
repeat (100) rc4_test_string();
time_b = current_time;
show_debug_message("RC4 tests completed in " + string(time_b-time_a) + "ms.");
