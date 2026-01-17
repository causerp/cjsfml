package cjsfml.window

import cjsfml.system.*

public interface SFMLWindow <: ResourceHandle {
    func closeWindow(): Unit

    prop isOpen: Bool

    func pollEvent(): ?Event

    func waitEvent(): ?Event

    mut prop position: Vector2i

    mut prop size: Vector2u

    func setTitle(title: String): Unit

    func setIcon(width: UInt32, height: UInt32, pixels: Array<UInt8>): Unit

    func setIcon(width: UInt32, height: UInt32, pixels: CPointer<UInt8>): Unit

    func setVisible(visible: Bool): Unit

    func setMouseCursorVisible(visible: Bool): Unit

    func setMouseCursorGrabbed(grabbed: Bool): Unit

    func setMouseCursor(cursor: Cursor): Unit

    func setKeyRepeatEnabled(enabled: Bool): Unit

    func setJoystickThreshold(threshold: Float32): Unit

    func requestFocus(): Unit

    prop hasFocus: Bool

    prop systemHandle: CPointer<Unit>

    // extra

    func setVerticalSyncEnabled(enabled: Bool): Unit

    func display(): Unit
}
