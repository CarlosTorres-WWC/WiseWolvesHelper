public virtual class TriggerHelper{
    public void process(){
        if(Trigger.isBefore){
	    if(Trigger.isUpdate){
            	processBeforeUpdate();
            }else if(Trigger.isInsert){
	       processBeforeInsert();
	    }
        }else if(Trigger.isAfter){
            if(Trigger.isInsert){
                processAfterInsert();
            }else if(Trigger.isUpdate){
                processAfterUpdate();
            }
        }
    }
    public virtual void processBeforeUpdate(){}
    public virtual void processBeforeInsert(){}
    public virtual void processAfterUpdate(){}
    public virtual void processAfterInsert(){}
}
