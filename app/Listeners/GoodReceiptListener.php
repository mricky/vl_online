<?php

namespace App\Listeners;

use App\Events\OrderEntryEvent;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Repositories\GoodReceiptRepository;

class GoodReceiptListener
{
    private $goodReceipt;
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct(GoodReceiptRepository $goodReceipt)
    {
        $this->goodReceipt = $goodReceipt;
    }

    /**
     * Handle the event.
     *
     * @param  Event  $event
     * @return void
     */
    public function handle(OrderEntryEvent $event)
    {
        // $event->purchase
        $this->goodReceipt->automaticReceiptEntry($event->purchase->id);
    }
}
