// Generated by gencpp from file duckietown_msgs/ObstacleProjectedDetectionList.msg
// DO NOT EDIT!


#ifndef DUCKIETOWN_MSGS_MESSAGE_OBSTACLEPROJECTEDDETECTIONLIST_H
#define DUCKIETOWN_MSGS_MESSAGE_OBSTACLEPROJECTEDDETECTIONLIST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <duckietown_msgs/ObstacleProjectedDetection.h>

namespace duckietown_msgs
{
template <class ContainerAllocator>
struct ObstacleProjectedDetectionList_
{
  typedef ObstacleProjectedDetectionList_<ContainerAllocator> Type;

  ObstacleProjectedDetectionList_()
    : header()
    , list()  {
    }
  ObstacleProjectedDetectionList_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , list(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector< ::duckietown_msgs::ObstacleProjectedDetection_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::duckietown_msgs::ObstacleProjectedDetection_<ContainerAllocator> >> _list_type;
  _list_type list;





  typedef boost::shared_ptr< ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator> const> ConstPtr;

}; // struct ObstacleProjectedDetectionList_

typedef ::duckietown_msgs::ObstacleProjectedDetectionList_<std::allocator<void> > ObstacleProjectedDetectionList;

typedef boost::shared_ptr< ::duckietown_msgs::ObstacleProjectedDetectionList > ObstacleProjectedDetectionListPtr;
typedef boost::shared_ptr< ::duckietown_msgs::ObstacleProjectedDetectionList const> ObstacleProjectedDetectionListConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator1> & lhs, const ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.list == rhs.list;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator1> & lhs, const ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace duckietown_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator> >
{
  static const char* value()
  {
    return "11b067403fefa6151edc8b44e25edac3";
  }

  static const char* value(const ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x11b067403fefa615ULL;
  static const uint64_t static_value2 = 0x1edc8b44e25edac3ULL;
};

template<class ContainerAllocator>
struct DataType< ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator> >
{
  static const char* value()
  {
    return "duckietown_msgs/ObstacleProjectedDetectionList";
  }

  static const char* value(const ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"duckietown_msgs/ObstacleProjectedDetection[] list\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: duckietown_msgs/ObstacleProjectedDetection\n"
"geometry_msgs/Point location\n"
"duckietown_msgs/ObstacleType type\n"
"float32 distance\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: duckietown_msgs/ObstacleType\n"
"uint8 DUCKIE=0\n"
"uint8 CONE=1\n"
"uint8 type\n"
;
  }

  static const char* value(const ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.list);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ObstacleProjectedDetectionList_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::duckietown_msgs::ObstacleProjectedDetectionList_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "list[]" << std::endl;
    for (size_t i = 0; i < v.list.size(); ++i)
    {
      s << indent << "  list[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::duckietown_msgs::ObstacleProjectedDetection_<ContainerAllocator> >::stream(s, indent + "    ", v.list[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // DUCKIETOWN_MSGS_MESSAGE_OBSTACLEPROJECTEDDETECTIONLIST_H
