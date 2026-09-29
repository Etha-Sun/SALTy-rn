Ltac useGoal := match goal with |- ?a = ?a => reflexivity end.
all: useGoal.
Show.
