

#ifndef OPENFLOW_UTILITY_ARP_WRAPPER_H_
#define OPENFLOW_UTILITY_ARP_WRAPPER_H_

#include <omnetpp.h>
#include "inet/linklayer/common/MACAddress.h"

using namespace omnetpp;

namespace ofp{

class ARP_Wrapper: public cObject {

public:
    ARP_Wrapper();
    ~ARP_Wrapper();

    const std::string& getSrcIp() const;
    void setSrcIp(const std::string& srcIp);

    const inet::MACAddress& getSrcMacAddress() const;
    void setSrcMacAddress(const inet::MACAddress& macAddress);



protected:
    std::string srcIp;
    inet::MACAddress srcMac;
};

} /*end namespace ofp*/


#endif /* OPENFLOW_UTILITY_ARP_WRAPPER_H_ */
