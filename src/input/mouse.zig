/// The state of a mouse button.
///
/// This is backed by a c_int so we can use this as-is for our embedding API.
///
/// IMPORTANT: Any changes here update include/ghostty.h
pub const MouseButtonState = enum(c_int) {
    release,
    press,
};

/// Possible mouse buttons. We only track up to 11 because thats the maximum
/// button input that terminal mouse tracking handles without becoming
/// ambiguous.
///
/// Its a bit silly to name numbers like this but given its a restricted
/// set, it feels better than passing around raw numeric literals.
///
/// This is backed by a c_int so we can use this as-is for our embedding API.
///
/// IMPORTANT: Any changes here update include/ghostty.h
pub const MouseButton = enum(c_int) {
    const Self = @This();

    /// The maximum value in this enum. This can be used to create a densely
    /// packed array, for example.
    pub const max = max: {
        var cur = 0;
        for (@typeInfo(Self).Enum.fields) |field| {
            if (field.value > cur) cur = field.value;
        }

        break :max cur;
    };

    unknown = 0,
    left = 1,
    right = 2,
    middle = 3,
    four = 4,
    five = 5,
    six = 6,
    seven = 7,
    eight = 8,
    nine = 9,
    ten = 10,
    eleven = 11,
};
