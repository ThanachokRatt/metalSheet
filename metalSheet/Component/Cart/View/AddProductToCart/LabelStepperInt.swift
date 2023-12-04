//
//  LabelStepperInt.swift
//  metalSheet
//
//  Created by Schweppe on 30/11/2566 BE.
//

import SwiftUI

public struct LabelStepperInt: View {

    public init(
        _ title: String,
        description: String = "",
        value: Binding<Int>,
        in range: ClosedRange<Int> = 0...Int.max,
        longPressInterval: Double = 0.3,
        repeatOnLongPress: Bool = true,
        style: StyleInt = .init()
    ) {
        self.title = title
        self.description = description
        self._value = value
        self.range = range
        self.longPressInterval = longPressInterval
        self.repeatOnLongPress = repeatOnLongPress
    }

    @Binding public var value: Int

    public var title: String = ""
    public var description: String = ""
    public var range = 0...Int.max
    public var longPressInterval = 0.3
    public var repeatOnLongPress = true

    public var style = Style()

    @State private var timer: Timer?
    private var isPlusButtonDisabled: Bool { value >= range.upperBound }
    private var isMinusButtonDisabled: Bool { value <= range.lowerBound }

    /// Perform the math operation passed into the function on the `value` and `1` each time the internal timer runs
    private func onPress(_ isPressing: Bool, operation: @escaping (inout Int, Int) -> ()) {

        guard isPressing else { timer?.invalidate(); return }

        func action(_ timer: Timer?) {
            operation(&value, 1)
        }

        /// Instant action call for short press action
        action(timer)

        guard repeatOnLongPress else { return }

        timer = Timer.scheduledTimer(
            withTimeInterval: longPressInterval,
            repeats: true,
            block: action
        )
    }
    enum FocusFieldInt{
        case int
        
    }
    @FocusState private var focusField: FocusFieldInt?

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

                TextField("1", text: Binding(
                    get: {
                        if focusField != nil{
                            return "\(value)"
                        }else{
                           return "\(value)"
                        }
                        
                    },
                                set: {
                                    if let newValue = Int($0) {
                                        value = min(max(range.lowerBound, newValue), range.upperBound)
                                    }
                                }
                            ))
                .focused($focusField,equals: .int)
                      .keyboardType(.numberPad)
                            .foregroundColor(style.valueColor)
                            .frame(width: style.labelWidth, height: style.height)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .multilineTextAlignment(.center)


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

/*struct LabelStepperInt_Previews: PreviewProvider {

    static var previews: some View {
        LabelStepperInt(
            "Title",
            description: "description",
            value: .constant(5)
        )
            .previewLayout(.sizeThatFits)
            .padding()
    }
}*/


public struct StyleInt {

    public init(
        height: Double = 34.0,
        labelWidth: Double = 58.0,
        buttonWidth: Double = 58.0,
        buttonPadding: Double = 16.0,
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
