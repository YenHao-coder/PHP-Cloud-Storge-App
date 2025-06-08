<ul class="nav nav-tabs myTabs justify-content-center">
    <?php
    // 列出產品類別第一層
    $SQLstring = "SELECT * FROM pyclass WHERE level=1 ORDER BY sort";
    $pyclass01 = $link->query($SQLstring);
    while ($pyclass01_Rows = $pyclass01->fetch()) {
        $firstLevel = $pyclass01_Rows['classid']; ?>
        <li class="nav-item">
            <span  class="nav-link tab-link" aria-selected="false" data-bs-toggle="tab" data-bs-target="#tab-content-<?php echo $firstLevel; ?>" role="tab" aria-controls="tab-content-<?php echo $firstLevel; ?>"><a href="drugstore.php?classid=<?php echo $pyclass01_Rows['classid']; ?>&level=1" style="color:#e9ecef;"><i class="fas <?php echo $pyclass01_Rows['fonticon']; ?>  fa-lg fa-fw"></i><?php echo $pyclass01_Rows['cname']; ?></a></span>
        </li>
    <?php } ?>
</ul>

<div class="tab-content tab-pane-content">
    <?php
    //列出產品類別對應的第二層資料
    $SQLstring0 = "SELECT * FROM pyclass WHERE level=1 ORDER BY sort";
    $pyclass01_again = $link->query($SQLstring0);
    while ($pyclass01_AgainRows = $pyclass01_again->fetch()) {
        $firstLevel = $pyclass01_AgainRows['classid']; ?>

        <div id="tab-content-<?php echo $firstLevel; ?>" class="tab-pane fade" role="tabpanel" aria-labelledby="tab-content-<?php echo $firstLevel; ?>-tab">
            <ul class="nav nav-tabs justify-content-center" id="mySubTabs<?php echo $firstLevel; ?>" role="tablist">
                <?php
                // 列出產品類別對應的第二層資料
                $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=2 AND uplink=%d ORDER BY sort", $firstLevel);
                $pyclass02 = $link->query($SQLstring);
                while ($pyclass02_Rows = $pyclass02->fetch()) {
                    $secondLevelId = $pyclass02_Rows['classid'];
                ?>
                    <li class="nav-item" role="presentation">
                        <a
                            class="nav-link"
                            href="drugstore.php?classid=<?php echo $pyclass02_Rows['classid']; ?>"
                            id="subtab<?php echo $secondLevelId; ?>-tab"
                            role="tab"
                            aria-controls="subtab<?php echo $secondLevelId; ?>"
                            aria-selected="true"><em class="fas <?php echo $pyclass02_Rows['fonticon']; ?> fa-fw"></em><?php echo $pyclass02_Rows['cname']; ?></a>
                    </li>
                <?php } ?>
            </ul>
        </div>
    <?php } ?>
</div>
