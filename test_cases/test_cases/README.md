# Solutions:

## basic_reachable.bc

Reachable

7->8->1

## basic_unreachable.bc

Unreachable

## cycle.bc (report any 1 or more of the equivalent cycle path variations):

Reachable

7->8->9->10->11->12->13->15->1

7->8->9->10->Cycle[11->12->13->14->17->19->21->11]->12->13->15->1

## multiple_callsites.bc

Reachable

7->8->9->12->13->1

## multiple_paths.bc

Reachable

8->9->10->11->12->1->2->3->4->13->16->14->5

8->9->10->11->14->5