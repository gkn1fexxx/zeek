# The default is for an initialization error to be a hard failure.
# Behavior may be changed via the `allow_init_errors` option.

# @TEST-EXEC-FAIL: unset ZEEK_ALLOW_INIT_ERRORS && bro -b %INPUT >out 2>&1
# @TEST-EXEC: TEST_DIFF_CANONIFIER=$SCRIPTS/diff-remove-abspath btest-diff out

event bro_init() &priority=10
	{
	print "1st event";
	}

event bro_init() &priority=10
	{
	print "2nd event";
	local v = vector(1, 2, 3);
	print v[10];
	}

event bro_init() &priority=-10
	{
	print "3rd event";
	}