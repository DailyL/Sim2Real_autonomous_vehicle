// Generated by gencpp from file duckietown_msgs/NodeGetParamsListResponse.msg
// DO NOT EDIT!


#ifndef DUCKIETOWN_MSGS_MESSAGE_NODEGETPARAMSLISTRESPONSE_H
#define DUCKIETOWN_MSGS_MESSAGE_NODEGETPARAMSLISTRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <duckietown_msgs/NodeParameter.h>

namespace duckietown_msgs
{
template <class ContainerAllocator>
struct NodeGetParamsListResponse_
{
  typedef NodeGetParamsListResponse_<ContainerAllocator> Type;

  NodeGetParamsListResponse_()
    : parameters()  {
    }
  NodeGetParamsListResponse_(const ContainerAllocator& _alloc)
    : parameters(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::duckietown_msgs::NodeParameter_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::duckietown_msgs::NodeParameter_<ContainerAllocator> >> _parameters_type;
  _parameters_type parameters;





  typedef boost::shared_ptr< ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator> const> ConstPtr;

}; // struct NodeGetParamsListResponse_

typedef ::duckietown_msgs::NodeGetParamsListResponse_<std::allocator<void> > NodeGetParamsListResponse;

typedef boost::shared_ptr< ::duckietown_msgs::NodeGetParamsListResponse > NodeGetParamsListResponsePtr;
typedef boost::shared_ptr< ::duckietown_msgs::NodeGetParamsListResponse const> NodeGetParamsListResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator1> & lhs, const ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator2> & rhs)
{
  return lhs.parameters == rhs.parameters;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator1> & lhs, const ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace duckietown_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6d0f5ba1e047603a0b1306ec478bb3e5";
  }

  static const char* value(const ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6d0f5ba1e047603aULL;
  static const uint64_t static_value2 = 0x0b1306ec478bb3e5ULL;
};

template<class ContainerAllocator>
struct DataType< ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "duckietown_msgs/NodeGetParamsListResponse";
  }

  static const char* value(const ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "duckietown_msgs/NodeParameter[] parameters\n"
"\n"
"\n"
"================================================================================\n"
"MSG: duckietown_msgs/NodeParameter\n"
"# Parameter type (this has to match duckietown.TopicType)\n"
"uint8 PARAM_TYPE_UNKNOWN = 0\n"
"uint8 PARAM_TYPE_STRING = 1\n"
"uint8 PARAM_TYPE_INT = 2\n"
"uint8 PARAM_TYPE_FLOAT = 3\n"
"uint8 PARAM_TYPE_BOOL = 4\n"
"\n"
"string node         # Name of the node\n"
"string name         # Name of the parameter (fully resolved)\n"
"string help         # Description of the parameter\n"
"uint8 type          # Type of the parameter (see PARAM_TYPE_X above)\n"
"float32 min_value   # Min value (for type INT, UINT, and FLOAT)\n"
"float32 max_value   # Max value (for type INT, UINT, and FLOAT)\n"
"bool editable       # Editable (it means that the node will be notified for changes)\n"
;
  }

  static const char* value(const ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.parameters);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct NodeGetParamsListResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::duckietown_msgs::NodeGetParamsListResponse_<ContainerAllocator>& v)
  {
    s << indent << "parameters[]" << std::endl;
    for (size_t i = 0; i < v.parameters.size(); ++i)
    {
      s << indent << "  parameters[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::duckietown_msgs::NodeParameter_<ContainerAllocator> >::stream(s, indent + "    ", v.parameters[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // DUCKIETOWN_MSGS_MESSAGE_NODEGETPARAMSLISTRESPONSE_H
