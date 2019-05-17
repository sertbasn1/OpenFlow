
#ifndef OPENFLOW_OPENFLOW_CONTROLLER_SWITCH_INFO_H_
#define OPENFLOW_OPENFLOW_CONTROLLER_SWITCH_INFO_H_

#include <openflow/openflow/protocol/OpenFlow.h>

#include "inet/transportlayer/contract/tcp/TCPSocket.h"

namespace ofp{

class Switch_Info {
    public:
        Switch_Info();

        int getConnId() const;
        void setConnId(int connId);
        int getVersion() const;
        void setVersion(int version);
        std::string getMacAddress() const;
        void setMacAddress(std::string macAddress);
        int getNumOfPorts() const;
        void setNumOfPorts(int numOfPorts);
        inet::TCPSocket* getSocket() const;
        void setSocket(inet::TCPSocket* socket);


    protected:
        int connID;
        int numOfPorts;
        std::string macAddress;
        inet::TCPSocket *socket;
        int version;

};

} /*end namespace ofp*/

#endif /* OPENFLOW_OPENFLOW_CONTROLLER_SWITCH_INFO_H_ */
