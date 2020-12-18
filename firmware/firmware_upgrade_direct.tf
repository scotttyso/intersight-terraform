resource "intersight_firmware_upgrade" "blade-firmware-update" {
  /*
  Description: "Desired upgrade mode to choose either direct download based upgrade or network share upgrade."
  ~ `direct_upgrade` - Upgrade mode is direct download.
  ~ `network_upgrade` - Upgrade mode is network upgrade.
  */
  upgrade_type =  "direct_upgrade"

  direct_download {
    class_id = "firmware.DirectDownload"
    http_server {
      location_link = ""
    }
    /*
     Description: "Source type referring the image to be downloaded from CCO or from a local HTTPS server.
    ~ `cisco` - Image to be downloaded from Cisco software repository.
    ~ `localHttp` - Image to be downloaded from a https server."
    */
    image_source = "cisco"

    object_type = "firmware.DirectDownload"
    /* 
    Description: "Option to control the upgrade, e.g., sd_upgrade_mount_only - download the image into sd and upgrade wait for the server on-next boot.
     ~ `sd_upgrade_mount_only` - Direct upgrade SD upgrade mount only.
     ~ `sd_download_only` - Direct upgrade SD download only.
     ~ `sd_upgrade_only` - Direct upgrade SD upgrade only.
     ~ `sd_upgrade_full` - Direct upgrade SD upgrade full.
     ~ `upgrade_full` - The upgrade downloads or mounts the image, and reboots immediately for an upgrade.
     ~ `upgrade_mount_only` - The upgrade downloads or mounts the image. The upgrade happens in next reboot.
     ~ `chassis_upgrade_full` - Direct upgrade chassis upgrade full." 
     */
    upgradeoption = "upgrade_full"

    /*
    http_server {
        location_link = "http://10.5.30.39/staticfiles/ucs-c240m5-huu-4.1.1f.iso"
    }
    */
  }

  distributable {
    object_type = "firmware.Distributable"
    /* 
    Description.  What Image is to be used for the upgrade when doing direct_download with cisco.com aka intersight.com
    ~ * moid of the file, pulled from intersight API
    ~ * selector for the name of the file
    ~ Only need one or the other.  Comment out whichever is unused
    */
    moid = "5f90656b6567612d3184425e"
    # selector = "$filter(Name eq '${var.image}')"
  }

  network_share {
    /*
    * `nfs` - File server protocol used is NFS.
    * `cifs` - File server protocol used is CIFS.
    * `www` - File server protocol used is WWW.
    */
    map_type = "nfs"

    nfs_server {
        file_location = ""
    }

    cifs_server {
        file_location = "" 
    }

    http_server {
      location_link = ""
    }
  }

  # skip_estimate_impact {}

  server {
    # Server Type is either compute.Blade or compute.RackUnit
    object_type = var.object_type
    moid = data.intersight_compute_blade.default.moid
  }
}