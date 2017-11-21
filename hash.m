function hashtable = hash(table)
    table(:,1:2)=table(:,1:2)-1;
    hashtable=[table(:,4)*2^16+table(:,1)*2^8+table(:,2),table(:,3),table(:,5)];