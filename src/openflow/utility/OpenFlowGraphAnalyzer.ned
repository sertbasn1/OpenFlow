

package openflow.utility;

// Calculates a Spanning Tree in the OpenFlow network.
// The purpose is to prevent packet loops in the network.
simple OpenFlowGraphAnalyzer
{
    parameters:
        @class(ofp::OpenFlowGraphAnalyzer);
        @display("i=spanning-tree");
        string NodeType = default("openflow.openflow.switch.Open_Flow_Switch inet.node.inet.StandardHost");
		bool considerOnlyEndToEnd = default(true);
}
