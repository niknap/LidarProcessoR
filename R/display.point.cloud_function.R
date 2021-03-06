#' Plot point cloud in 3D space
#'
#' Function for 3-dimensional point cloud visualization.
#' @param pc Point cloud in XYZ-table format (important: column names need to be X, Y and Z)
#' @param col.palette Color palette
#' @param col.field String with name of the column which contains the information for coloring
#' @param col.field.lim Vector of two elements specifying the limits of the col.field values
#' @return 3D plot in rgl window
#' @keywords 3D plot display point cloud graphics visualization lidar
#' @export
#' @examples in progress
#' @author Nikolai Knapp, nikolai.knapp@ufz.de

display.point.cloud <- function(pc, col.palette=NA, col.var="Z", col.lim=c(0, 50), size=1){
  # If no custom color palette is provided, create and apply a blue to red heat color palette
  if(is.na(col.palette)){ 
    col.palette <- colorRampPalette(c("darkblue", "blue", "cyan", "green", "yellow", "orange", "red", "darkred"), space = "Lab")(50)
  }
  # Rescale the raw values to a color index vector that contains the indices of the
  # color vector as whole numbers
  col.index <- round((length(col.palette)-1) * (pc[, col.var]-col.lim[1]) / (col.lim[2]-col.lim[1]))+1
  # Create 3D plot with coloring according to height
  bg3d("black")
  plot3d(pc$X, pc$Y, pc$Z, col=col.palette[col.index],
         aspect=F, axes=F, box=F, xlab="", ylab="", zlab="", size=size)
}
