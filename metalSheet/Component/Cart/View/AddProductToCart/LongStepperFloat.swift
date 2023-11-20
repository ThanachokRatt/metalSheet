//
//  LongStepperFloat.swift
//  metalSheet
//
//  Created by Schweppe on 17/11/2566 BE.
//

import SwiftUI

public struct LabeledStepper2: View {

    public init(
        _ title: String,
        description: String = "",
        value: Binding<Float>, // Change the type to Float
        in range: ClosedRange<Float> = 0...Float.infinity, // Change the type to Float
        longPressInterval: Double = 0.3,
        repeatOnLongPress: Bool = true,
        style: Style = .init()
    ) {
        self.title = title
        self.description = description
        self._value = value
        self.range = range
        self.longPressInterval = longPressInterval
        self.repeatOnLongPress = repeatOnLongPress
    }

    @Binding public var value: Float // Change the type to Float

    public var title: String = ""
    public var description: String = ""
    public var range = 0...Float.infinity // Change the type to Float
    public var longPressInterval = 0.3
    public var repeatOnLongPress = true

    public var style = Style()

    @State private var timer: Timer?
    private var isPlusButtonDisabled: Bool { value >= range.upperBound }
    private var isMinusButtonDisabled: Bool { value <= range.lowerBound }

    /// Perform the math operation passed into the function on the `value` and `1` each time the internal timer runs
    private func onPress(_ isPressing: Bool, operation: @escaping (inout Float, Float) -> ()) {
        guard isPressing else { timer?.invalidate(); return }

        func action(_ timer: Timer?) {
            // Use a dynamic step size based on precision
            let step: Float = pow(10, -2.0) // Change the exponent based on precision
            operation(&value, step)
        }

        // Instant action call for short press action
        action(timer)

        guard repeatOnLongPress else { return }

        timer = Timer.scheduledTimer(
            withTimeInterval: longPressInterval,
            repeats: true,
            block: action
        )
    }


    public var body: some View {

        HStack {
            Text(title)
                .foregroundColor(style.titleColor)

            Text(description)
                .foregroundColor(style.descriptionColor)

            Spacer()

            HStack(spacing: 0) {
                /// - Note: The action will be performed inside the `.onLongPressGesture` modifier.
                Button() { } label: { Image(systemName: "minus") }
                .onLongPressGesture(
                    minimumDuration: 0
                ) {} onPressingChanged: { onPress($0, operation: -=) }
                .frame(width: style.buttonWidth, height: style.height)
                .disabled(isMinusButtonDisabled)
                .foregroundColor(
                    isMinusButtonDisabled
                    ? style.inactiveButtonColor
                    : style.activeButtonColor
                )
                .contentShape(Rectangle())

                Divider()
                    .padding([.top, .bottom], 8)

                Text(String(format: "%.2f", value)) // Display value with two decimal places
                                   .foregroundColor(style.valueColor)
                                   .frame(width: style.labelWidth, height: style.height)

                Divider()
                    .padding([.top, .bottom], 8)

                /// - Note: The action will be performed inside the `.onLongPressGesture` modifier.
                Button() { } label: { Image(systemName: "plus") }
                .onLongPressGesture(
                    minimumDuration: 0
                ) {} onPressingChanged: { onPress($0, operation: +=) }
                .frame(width: style.buttonWidth, height: style.height)
                .disabled(isPlusButtonDisabled)
                .foregroundColor(
                    isPlusButtonDisabled
                    ? style.inactiveButtonColor
                    : style.activeButtonColor
                    )
                .contentShape(Rectangle())
            }
            .background(style.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .frame(height: style.height)
        }
        .lineLimit(1)
    }
}

// MARK: - Preview

struct LabeledStepper_Previews: PreviewProvider {

    static var previews: some View {
        LabeledStepper2(
            "Title",
            description: "description",
            value: .constant(5.0) // Change the initial value to Float
        )
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

public struct Style {

    public init(
        height: Double = 34.0,
        labelWidth: Double = 48.0,
        buttonWidth: Double = 48.0,
        buttonPadding: Double = 12.0,
        backgroundColor: Color = Color(.quaternarySystemFill),
        activeButtonColor: Color = Color(.label),
        inactiveButtonColor: Color = Color(.tertiaryLabel),
        titleColor: Color = Color(.label),
        descriptionColor: Color = Color(.secondaryLabel),
        valueColor: Color = Color(.label)
    ) {
        self.height = height
        self.labelWidth = labelWidth
        self.buttonWidth = buttonWidth
        self.buttonPadding = buttonPadding
        self.backgroundColor = backgroundColor
        self.activeButtonColor = activeButtonColor
        self.inactiveButtonColor = inactiveButtonColor
        self.titleColor = titleColor
        self.descriptionColor = descriptionColor
        self.valueColor = valueColor
    }

    // TODO: Make these dynamic
    var height: Double
    var labelWidth: Double

    var buttonWidth: Double
    var buttonPadding: Double

    // MARK: - Colors
    var backgroundColor: Color
    var activeButtonColor: Color
    var inactiveButtonColor: Color

    var titleColor: Color
    var descriptionColor: Color
    var valueColor: Color
}
