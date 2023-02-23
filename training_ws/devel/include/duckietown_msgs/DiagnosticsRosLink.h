// Generated by gencpp from file duckietown_msgs/DiagnosticsRosLink.msg
// DO NOT EDIT!


#ifndef DUCKIETOWN_MSGS_MESSAGE_DIAGNOSTICSROSLINK_H
#define DUCKIETOWN_MSGS_MESSAGE_DIAGNOSTICSROSLINK_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace duckietown_msgs
{
template <class ContainerAllocator>
struct DiagnosticsRosLink_
{
  typedef DiagnosticsRosLink_<ContainerAllocator> Type;

  DiagnosticsRosLink_()
    : node()
    , topic()
    , remote()
    , direction(0)
    , connected(false)
    , transport()
    , messages(0)
    , dropped(0)
    , bytes(0.0)
    , frequency(0.0)
    , bandwidth(0.0)  {
    }
  DiagnosticsRosLink_(const ContainerAllocator& _alloc)
    : node(_alloc)
    , topic(_alloc)
    , remote(_alloc)
    , direction(0)
    , connected(false)
    , transport(_alloc)
    , messages(0)
    , dropped(0)
    , bytes(0.0)
    , frequency(0.0)
    , bandwidth(0.0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _node_type;
  _node_type node;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _topic_type;
  _topic_type topic;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _remote_type;
  _remote_type remote;

   typedef uint8_t _direction_type;
  _direction_type direction;

   typedef uint8_t _connected_type;
  _connected_type connected;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _transport_type;
  _transport_type transport;

   typedef uint64_t _messages_type;
  _messages_type messages;

   typedef uint64_t _dropped_type;
  _dropped_type dropped;

   typedef float _bytes_type;
  _bytes_type bytes;

   typedef float _frequency_type;
  _frequency_type frequency;

   typedef float _bandwidth_type;
  _bandwidth_type bandwidth;



// reducing the odds to have name collisions with Windows.h 
#if defined(_WIN32) && defined(LINK_DIRECTION_INBOUND)
  #undef LINK_DIRECTION_INBOUND
#endif
#if defined(_WIN32) && defined(LINK_DIRECTION_OUTBOUND)
  #undef LINK_DIRECTION_OUTBOUND
#endif

  enum {
    LINK_DIRECTION_INBOUND = 0u,
    LINK_DIRECTION_OUTBOUND = 1u,
  };


  typedef boost::shared_ptr< ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator> const> ConstPtr;

}; // struct DiagnosticsRosLink_

typedef ::duckietown_msgs::DiagnosticsRosLink_<std::allocator<void> > DiagnosticsRosLink;

typedef boost::shared_ptr< ::duckietown_msgs::DiagnosticsRosLink > DiagnosticsRosLinkPtr;
typedef boost::shared_ptr< ::duckietown_msgs::DiagnosticsRosLink const> DiagnosticsRosLinkConstPtr;

// constants requiring out of line definition

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator1> & lhs, const ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator2> & rhs)
{
  return lhs.node == rhs.node &&
    lhs.topic == rhs.topic &&
    lhs.remote == rhs.remote &&
    lhs.direction == rhs.direction &&
    lhs.connected == rhs.connected &&
    lhs.transport == rhs.transport &&
    lhs.messages == rhs.messages &&
    lhs.dropped == rhs.dropped &&
    lhs.bytes == rhs.bytes &&
    lhs.frequency == rhs.frequency &&
    lhs.bandwidth == rhs.bandwidth;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator1> & lhs, const ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace duckietown_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator> >
{
  static const char* value()
  {
    return "53a9a85eb8565abb4ba439662041c3aa";
  }

  static const char* value(const ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x53a9a85eb8565abbULL;
  static const uint64_t static_value2 = 0x4ba439662041c3aaULL;
};

template<class ContainerAllocator>
struct DataType< ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator> >
{
  static const char* value()
  {
    return "duckietown_msgs/DiagnosticsRosLink";
  }

  static const char* value(const ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Link direction\n"
"uint8 LINK_DIRECTION_INBOUND = 0\n"
"uint8 LINK_DIRECTION_OUTBOUND = 1\n"
"\n"
"string node         # Node publishing this message\n"
"string topic        # Topic transferred over the link\n"
"string remote       # Remote end of this link\n"
"uint8 direction     # Link direction\n"
"bool connected      # Status of the link\n"
"string transport    # Type of transport used for this link\n"
"uint64 messages     # Number of messages transferred over this link\n"
"uint64 dropped      # Number of messages dropped over this link\n"
"float32 bytes       # Volume of data transferred over this link\n"
"float32 frequency   # Link frequency (Hz)\n"
"float32 bandwidth   # Link bandwidth (byte/s)\n"
;
  }

  static const char* value(const ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.node);
      stream.next(m.topic);
      stream.next(m.remote);
      stream.next(m.direction);
      stream.next(m.connected);
      stream.next(m.transport);
      stream.next(m.messages);
      stream.next(m.dropped);
      stream.next(m.bytes);
      stream.next(m.frequency);
      stream.next(m.bandwidth);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DiagnosticsRosLink_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::duckietown_msgs::DiagnosticsRosLink_<ContainerAllocator>& v)
  {
    s << indent << "node: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.node);
    s << indent << "topic: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.topic);
    s << indent << "remote: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.remote);
    s << indent << "direction: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.direction);
    s << indent << "connected: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.connected);
    s << indent << "transport: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.transport);
    s << indent << "messages: ";
    Printer<uint64_t>::stream(s, indent + "  ", v.messages);
    s << indent << "dropped: ";
    Printer<uint64_t>::stream(s, indent + "  ", v.dropped);
    s << indent << "bytes: ";
    Printer<float>::stream(s, indent + "  ", v.bytes);
    s << indent << "frequency: ";
    Printer<float>::stream(s, indent + "  ", v.frequency);
    s << indent << "bandwidth: ";
    Printer<float>::stream(s, indent + "  ", v.bandwidth);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DUCKIETOWN_MSGS_MESSAGE_DIAGNOSTICSROSLINK_H