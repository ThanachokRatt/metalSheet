//
//  LongStepperFloat.swift
//  metalSheet
//
//  Created by Schweppe on 17/11/2566 BE.
//

import SwiftUI
import UIKit

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
            formatValue()
            
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
    private func formatValue() {
        if focusField != nil {
            value = Float(String(format: "%.2f", value)) ?? 0.0
        } 
    }
    enum FocusField{
        case dec
        case int
        
    }
    @FocusState private var focusField: FocusField?
    

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

                TextField("1.00", text: Binding(
                    get: {
                        if focusField != nil{
                            return value.truncatingRemainder(dividingBy: 1) == 0 ? "\(Int(value))" : String(value)
                            
                        }else{
                            return String(format: "%.2f", value)
                        }
                    },
                    set: {
                        if let newValue = Float($0) {
                            value = min(max(range.lowerBound, newValue), range.upperBound)
                        }
                    }
                ))
                .focused($focusField,equals: .dec)
                               .keyboardType(.decimalPad)
                               
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
      /*  .toolbar{
            ToolbarItem(placement: .keyboard) {
             Spacer()

            }
            
            ToolbarItem(placement: .keyboard) {
                Button{
                    focusField = nil
                } label: {
                    Text("เสร็จสิ้น")
                        .foregroundColor(.blue)
                }
                .opacity(focusField != nil ? 1.0 : 0.0)
                          .disabled(focusField == nil)
            }
        }*/
    }
    
}


// MARK: - Preview

/*struct LabeledStepper_Previews: PreviewProvider {

    static var previews: some View {
        LabeledStepper2(
            "Title",
            description: "description",
            value: .constant(5.0) // Change the initial value to Float
        )
            .previewLayout(.sizeThatFits)
            .padding()
    }
}*/

import SwiftUI

public struct Style {

	public init(
		height: Double = 34.0,
		buttonWidth: Double = 60.0,
		buttonPadding: Double = 16.0,
		backgroundColor: Color = Color(.quaternarySystemFill),
		activeButtonColor: Color = Color(.label),
		inactiveButtonColor: Color = Color(.tertiaryLabel),
		titleColor: Color = Color(.label),
		descriptionColor: Color = Color(.secondaryLabel),
		valueColor: Color = Color(.label)
	) {
		self.height = height
		self.buttonWidth = buttonWidth
		self.buttonPadding = buttonPadding
		self.backgroundColor = backgroundColor
		self.activeButtonColor = activeButtonColor
		self.inactiveButtonColor = inactiveButtonColor
		self.titleColor = titleColor
		self.descriptionColor = descriptionColor
		self.valueColor = valueColor

		if UIDevice.current.userInterfaceIdiom == .pad {
			self.labelWidth = 90.0
		} else {
			self.labelWidth = 67.0
		}
		
	}

	// Make these dynamic
	public var height: Double
	public var labelWidth: Double
	public var buttonWidth: Double
	public var buttonPadding: Double

	// MARK: - Colors
	public var backgroundColor: Color
	public var activeButtonColor: Color
	public var inactiveButtonColor: Color

	public var titleColor: Color
	public var descriptionColor: Color
	public var valueColor: Color
}
