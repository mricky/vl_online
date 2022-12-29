<?php

namespace App\Listeners;

use App\Events\OrderEntryEvent;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Repositories\{
    GoodReceiptRepository,
    PurchaseOrderRepository
};

class GoodReceiptListener
{
    private $goodReceipt;
    private $purchaseOrder;
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct(GoodReceiptRepository $goodReceipt,PurchaseOrderRepository $purchaseOrderRepository)
    {
        $this->goodReceipt = $goodReceipt;
        $this->purchaseOrder = $purchaseOrderRepository;
    }

    /**
     * Handle the event.
     *
     * @param  Event  $event
     * @return void
     */
    public function handle(OrderEntryEvent $event)
    {
        $this->goodReceipt->automaticReceiptEntry($event->purchase->id);
        $this->goodReceipt->syncPurchaseItemQty($event->purchase->id);
        $this->purchaseOrder->updateDetailPurchaseOrder($event->purchase->id);
    }
}
