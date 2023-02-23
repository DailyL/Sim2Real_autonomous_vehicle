class TurnCounter:
    TURN_START, TURN_MIDDLE, CENTER = list(range(3))

    def __init__(self):
        self.num_turns = 0
        self.state = self.TURN_START

    def reset_count(self):
        self.num_turns = 0
        self.state = self.TURN_START

    def cbmsg(self, msg):
        if abs(msg - 0.5) < 0.2:
            msg = "center"
        crossing = False

        if self.state == self.TURN_START:
            if msg == -1:
                self.state = self.TURN_MIDDLE
        elif self.state == self.TURN_MIDDLE:
            if msg == "center":
                self.state = self.CENTER
                self.num_turns += 1.0
                crossing = True
        elif self.state == self.CENTER:
            if msg != "center":
                self.state = self.TURN_START
        return crossing, self.num_turns
