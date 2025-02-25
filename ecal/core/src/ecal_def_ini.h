/* ========================= eCAL LICENSE =================================
 *
 * Copyright (C) 2016 - 2019 Continental Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * ========================= eCAL LICENSE =================================
*/

/**
 * @brief  eCAL ini file keys
**/

#pragma once

/////////////////////////////////////
// common
/////////////////////////////////////
#define  CMN_SECTION_S                    "common"
#define  CMN_REGISTRATION_TO_S            "registration_timeout"
#define  CMN_REGISTRATION_REFRESH_S       "registration_refresh"

/////////////////////////////////////
// network
/////////////////////////////////////
#define  NET_SECTION_S                    "network"

#define  NET_ENABLED_S                    "network_enabled"

#define  NET_UDP_MULTICAST_GROUP_S        "multicast_group"
#define  NET_UDP_MULTICAST_MASK_S         "multicast_mask"
#define  NET_UDP_MULTICAST_PORT_S         "multicast_port"
#define  NET_UDP_MULTICAST_TTL_S          "multicast_ttl"

#define  NET_UDP_MULTICAST_GROUP_METAL_S  "multicast_group_mtl"
#define  NET_UDP_MULTICAST_PORT_METAL_S   "multicast_port_mtl"

#define  NET_UDP_MULTICAST_SNDBUF_S       "multicast_sndbuf"
#define  NET_UDP_MULTICAST_RCVBUF_S       "multicast_rcvbuf"

#define  NET_UNICAST_MODE_S               "unicast_mode"
#define  NET_UDP_UNICAST_IPADDR_S         "unicast_ipaddr"
#define  NET_UDP_UNICAST_PORT_S           "unicast_port"

#define  NET_BANDWIDTH_MAX_UDP_S          "bandwidth_max_udp"

#define  NET_UDP_MC_REC_ENABLED_S         "udp_mc_rec_enabled"
#define  NET_UDP_UC_REC_ENABLED_S         "udp_uc_rec_enabled"
#define  NET_SHM_REC_ENABLED_S            "shm_rec_enabled"
#define  NET_METAL_REC_ENABLED_S          "metal_rec_enabled"
#define  NET_LCM_REC_ENABLED_S            "lcm_rec_enabled"
#define  NET_RTPS_REC_ENABLED_S           "rtps_rec_enabled"
#define  NET_INPROC_REC_ENABLED_S         "inproc_rec_enabled"

#define  NET_NPCAP_ENABLED_S              "npcap_enabled"

/////////////////////////////////////
// time
/////////////////////////////////////
#define  TIME_SECTION_S                   "time"
#define  TIME_SYNC_MOD_RT_S               "timesync_module_rt"
#define  TIME_SYNC_MOD_REPLAY_S           "timesync_module_replay"

/////////////////////////////////////
// process
/////////////////////////////////////
#define  PROCESS_SECTION_S                 "process"
#define  PROCESS_TERMINAL_EMULATOR_S       "terminal_emulator"

/////////////////////////////////////
// monitoring
/////////////////////////////////////
#define  MON_SECTION_S                    "monitoring"

#define  MON_TIMEOUT_S                    "timeout"
#define  MON_FILTER_EXCL_S                "filter_excl"
#define  MON_FILTER_INCL_S                "filter_incl"

#define  MON_LOG_FILTER_CON_S             "filter_log_con"
#define  MON_LOG_FILTER_FILE_S            "filter_log_file"
#define  MON_LOG_FILTER_UDP_S             "filter_log_udp"

/////////////////////////////////////
// sys
/////////////////////////////////////
#define  SYS_SECTION_S                    "sys"
#define  SYS_FILTER_EXCL_S                "filter_excl"

/////////////////////////////////////
// rtps
/////////////////////////////////////
#define  RTPS_SECTION_S                   "rtps"
#define  RTPS_DEFAULT_DOMAIN_S            "domain"

/////////////////////////////////////
// publisher
/////////////////////////////////////
#define  PUB_SECTION_S                    "publisher"

#define  PUB_USE_UDP_MC_S                 "use_udp_mc"
#define  PUB_USE_UDP_UC_S                 "use_udp_uc"
#define  PUB_USE_SHM_S                    "use_shm"
#define  PUB_USE_LCM_S                    "use_lcm"
#define  PUB_USE_RTPS_S                   "use_rtps"
#define  PUB_USE_INPROC_S                 "use_inproc"

#define  PUB_MEMFILE_MINSIZE_S            "memfile_minsize"
#define  PUB_MEMFILE_RESERVE_S            "memfile_reserve"
#define  PUB_MEMFILE_ACK_TO_S             "memfile_ack_timeout"

#define  PUB_SHARE_TTYPE_S                "share_ttype"
#define  PUB_SHARE_TDESC_S                "share_tdesc"
