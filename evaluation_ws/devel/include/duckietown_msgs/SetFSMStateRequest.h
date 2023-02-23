// Generated by gencpp from file duckietown_msgs/SetFSMStateRequest.msg
// DO NOT EDIT!


#ifndef DUCKIETOWN_MSGS_MESSAGE_SETFSMSTATEREQUEST_H
#define DUCKIETOWN_MSGS_MESSAGE_SETFSMSTATEREQUEST_H


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
struct SetFSMStateRequest_
{
  typedef SetFSMStateRequest_<ContainerAllocator> Type;

  SetFSMStateRequest_()
    : state()  {
    }
  SetFSMStateRequest_(const ContainerAllocator& _alloc)
    : state(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _state_type;
  _state_type state;





  typedef boost::shared_ptr< ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SetFSMStateRequest_

typedef ::duckietown_msgs::SetFSMStateRequest_<std::allocator<void> > SetFSMStateRequest;

typedef boost::shared_ptr< ::duckietown_msgs::SetFSMStateRequest > SetFSMStateRequestPtr;
typedef boost::shared_ptr< ::duckietown_msgs::SetFSMStateRequest const> SetFSMStateRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator1> & lhs, const ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator2> & rhs)
{
  return lhs.state == rhs.state;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator1> & lhs, const ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace duckietown_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "af6d3a99f0fbeb66d3248fa4b3e675fb";
  }

  static const char* value(const ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xaf6d3a99f0fbeb66ULL;
  static const uint64_t static_value2 = 0xd3248fa4b3e675fbULL;
};

template<class ContainerAllocator>
struct DataType< ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "duckietown_msgs/SetFSMStateRequest";
  }

  static const char* value(const ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string state\n"
;
  }

  static const char* value(const ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.state);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetFSMStateRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::duckietown_msgs::SetFSMStateRequest_<ContainerAllocator>& v)
  {
    s << indent << "state: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.state);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DUCKIETOWN_MSGS_MESSAGE_SETFSMSTATEREQUEST_H
